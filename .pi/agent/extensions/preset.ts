import { existsSync, readFileSync } from "node:fs";
import { homedir } from "node:os";
import { dirname, join, resolve } from "node:path";
import type { ExtensionAPI, ExtensionContext } from "@mariozechner/pi-coding-agent";
import { getAgentDir, isToolCallEventType } from "@mariozechner/pi-coding-agent";

type ThinkingLevel = "off" | "minimal" | "low" | "medium" | "high" | "xhigh";
type BashMode = "full" | "readonly";

interface PresetConfig {
	provider?: string;
	model?: string;
	thinkingLevel?: ThinkingLevel;
	tools?: string[];
	instructions?: string;
	instructionsFile?: string;
	bashMode?: BashMode;
}

interface Preset {
	name: string;
	provider?: string;
	model?: string;
	thinkingLevel?: ThinkingLevel;
	tools?: string[];
	instructions?: string;
	bashMode: BashMode;
}

interface LoadResult {
	presets: Record<string, Preset>;
	diagnostics: string[];
}

const DEFAULT_TOOLS = ["read", "bash", "edit", "write"];

const BLOCKED_PATTERNS = [
	/\brm\b/i,
	/\brmdir\b/i,
	/\bmv\b/i,
	/\bcp\b/i,
	/\bmkdir\b/i,
	/\btouch\b/i,
	/\bchmod\b/i,
	/\bchown\b/i,
	/\bchgrp\b/i,
	/\bln\b/i,
	/\btee\b/i,
	/\btruncate\b/i,
	/\bdd\b/i,
	/\bshred\b/i,
	/\bsed\s+-i\b/i,
	/\bperl\s+-pi\b/i,
	/\bxargs\b/i,
	/(^|[^<])>(?!>)/,
	/>>/,
	/&&/,
	/\|\|/,
	/;/,
	/`/,
	/\$\(/,
	/\bnpm\s+(install|uninstall|update|ci|link|publish|run|exec)\b/i,
	/\byarn\s+(add|remove|install|publish|set|run|exec)\b/i,
	/\bpnpm\s+(add|remove|install|publish|run|exec)\b/i,
	/\bpip\s+(install|uninstall)\b/i,
	/\bapt(-get)?\s+(install|remove|purge|update|upgrade)\b/i,
	/\bbrew\s+(install|uninstall|upgrade)\b/i,
	/\bgit\s+(add|commit|push|pull|merge|rebase|reset|checkout|switch|restore|stash|cherry-pick|revert|tag|init|clone|worktree)\b/i,
	/\bsudo\b/i,
	/\bsu\b/i,
	/\bkill\b/i,
	/\bpkill\b/i,
	/\bkillall\b/i,
	/\breboot\b/i,
	/\bshutdown\b/i,
	/\bsystemctl\s+(start|stop|restart|enable|disable)\b/i,
	/\bservice\s+\S+\s+(start|stop|restart)\b/i,
	/\b(vim?|nano|emacs|code|subl)\b/i,
];

const SAFE_PATTERNS = [
	/^\s*cat\b/i,
	/^\s*head\b/i,
	/^\s*tail\b/i,
	/^\s*less\b/i,
	/^\s*more\b/i,
	/^\s*grep\b/i,
	/^\s*find\b/i,
	/^\s*ls\b/i,
	/^\s*pwd\b/i,
	/^\s*echo\b/i,
	/^\s*printf\b/i,
	/^\s*wc\b/i,
	/^\s*sort\b/i,
	/^\s*uniq\b/i,
	/^\s*diff\b/i,
	/^\s*file\b/i,
	/^\s*stat\b/i,
	/^\s*du\b/i,
	/^\s*df\b/i,
	/^\s*tree\b/i,
	/^\s*which\b/i,
	/^\s*whereis\b/i,
	/^\s*type\b/i,
	/^\s*env\b/i,
	/^\s*printenv\b/i,
	/^\s*uname\b/i,
	/^\s*whoami\b/i,
	/^\s*id\b/i,
	/^\s*date\b/i,
	/^\s*uptime\b/i,
	/^\s*ps\b/i,
	/^\s*top\b/i,
	/^\s*htop\b/i,
	/^\s*free\b/i,
	/^\s*git\s+(status|log|diff|show|branch|remote|blame|config\s+--get)\b/i,
	/^\s*git\s+ls-/i,
	/^\s*npm\s+(list|ls|view|info|search|outdated|audit)\b/i,
	/^\s*pnpm\s+(list|why|info|outdated|audit)\b/i,
	/^\s*yarn\s+(list|info|why|outdated|audit)\b/i,
	/^\s*node\s+--version\b/i,
	/^\s*python\s+--version\b/i,
	/^\s*python3\s+--version\b/i,
	/^\s*jq\b/i,
	/^\s*sed\s+-n\b/i,
	/^\s*awk\b/i,
	/^\s*rg\b/i,
	/^\s*fd\b/i,
	/^\s*bat\b/i,
	/^\s*exa\b/i,
];

function expandHome(path: string): string {
	if (path === "~") return homedir();
	if (path.startsWith("~/")) return join(homedir(), path.slice(2));
	return path;
}

function resolvePath(baseDir: string, path: string): string {
	const expanded = expandHome(path);
	if (expanded.startsWith("/")) return expanded;
	return resolve(baseDir, expanded);
}

function readPresetFile(configPath: string): LoadResult {
	const presets: Record<string, Preset> = {};
	const diagnostics: string[] = [];

	if (!existsSync(configPath)) {
		return { presets, diagnostics };
	}

	let parsed: Record<string, PresetConfig>;

	try {
		parsed = JSON.parse(readFileSync(configPath, "utf-8")) as Record<string, PresetConfig>;
	} catch (error) {
		return {
			presets,
			diagnostics: [`Failed to parse ${configPath}: ${String(error)}`],
		};
	}

	const baseDir = dirname(configPath);

	for (const [name, raw] of Object.entries(parsed)) {
		if (!raw || typeof raw !== "object" || Array.isArray(raw)) {
			diagnostics.push(`Invalid preset \"${name}\" in ${configPath}`);
			continue;
		}

		let instructions = typeof raw.instructions === "string" ? raw.instructions.trim() : undefined;

		if (typeof raw.instructionsFile === "string" && raw.instructionsFile.trim()) {
			const filePath = resolvePath(baseDir, raw.instructionsFile.trim());
			if (!existsSync(filePath)) {
				diagnostics.push(`Preset \"${name}\" references missing file: ${filePath}`);
			} else {
				const fileText = readFileSync(filePath, "utf-8").trim();
				instructions = [instructions, fileText].filter(Boolean).join("\n\n") || undefined;
			}
		}

		presets[name] = {
			name,
			provider: raw.provider,
			model: raw.model,
			thinkingLevel: raw.thinkingLevel,
			tools: Array.isArray(raw.tools) ? raw.tools.filter((value): value is string => typeof value === "string") : undefined,
			instructions,
			bashMode: raw.bashMode === "readonly" ? "readonly" : "full",
		};
	}

	return { presets, diagnostics };
}

function loadPresets(cwd: string): LoadResult {
	const globalResult = readPresetFile(join(getAgentDir(), "presets.json"));
	const projectResult = readPresetFile(join(cwd, ".pi", "presets.json"));

	return {
		presets: {
			...globalResult.presets,
			...projectResult.presets,
		},
		diagnostics: [...globalResult.diagnostics, ...projectResult.diagnostics],
	};
}

function isReadOnlyCommand(command: string): boolean {
	if (BLOCKED_PATTERNS.some((pattern) => pattern.test(command))) {
		return false;
	}
	return SAFE_PATTERNS.some((pattern) => pattern.test(command));
}

export default function presetExtension(pi: ExtensionAPI) {
	let presets: Record<string, Preset> = {};
	let activePresetName: string | undefined;
	let activePreset: Preset | undefined;

	pi.registerFlag("preset", {
		description: "Preset configuration to use",
		type: "string",
	});

	function persistState() {
		pi.appendEntry("preset-state", { name: activePresetName ?? null });
	}

	function updateStatus(ctx: ExtensionContext) {
		if (!activePresetName) {
			ctx.ui.setStatus("preset", undefined);
			return;
		}
		ctx.ui.setStatus("preset", ctx.ui.theme.fg("accent", `preset:${activePresetName}`));
	}

	async function applyPreset(name: string, ctx: ExtensionContext, options?: { persist?: boolean }) {
		const preset = presets[name];
		if (!preset) {
			const available = Object.keys(presets).sort().join(", ") || "(none defined)";
			ctx.ui.notify(`Unknown preset \"${name}\". Available: ${available}`, "error");
			return false;
		}

		if (preset.provider && preset.model) {
			const model = ctx.modelRegistry.find(preset.provider, preset.model);
			if (!model) {
				ctx.ui.notify(`Preset \"${name}\": model ${preset.provider}/${preset.model} not found`, "warning");
			} else {
				const success = await pi.setModel(model);
				if (!success) {
					ctx.ui.notify(`Preset \"${name}\": no API key for ${preset.provider}/${preset.model}`, "warning");
				}
			}
		}

		if (preset.thinkingLevel) {
			pi.setThinkingLevel(preset.thinkingLevel);
		}

		if (preset.tools) {
			const allTools = new Set(pi.getAllTools().map((tool) => tool.name));
			const validTools = preset.tools.filter((tool) => allTools.has(tool));
			const invalidTools = preset.tools.filter((tool) => !allTools.has(tool));

			if (invalidTools.length > 0) {
				ctx.ui.notify(`Preset \"${name}\": unknown tools: ${invalidTools.join(", ")}`, "warning");
			}

			pi.setActiveTools(validTools);
		}

		activePresetName = name;
		activePreset = preset;
		updateStatus(ctx);

		if (options?.persist !== false) {
			persistState();
		}

		ctx.ui.notify(`Preset \"${name}\" activated`, "info");
		return true;
	}

	function clearPreset(ctx: ExtensionContext, options?: { persist?: boolean }) {
		activePresetName = undefined;
		activePreset = undefined;
		pi.setActiveTools(DEFAULT_TOOLS);
		updateStatus(ctx);

		if (options?.persist !== false) {
			persistState();
		}

		ctx.ui.notify("Preset cleared", "info");
	}

	pi.registerCommand("preset", {
		description: "Switch between preset modes",
		handler: async (args, ctx) => {
			const input = args?.trim();

			if (!input) {
				if (!ctx.hasUI) {
					ctx.ui.notify("Use /preset <name> in non-interactive mode", "warning");
					return;
				}

				const choices = [...Object.keys(presets).sort(), "(none)"];
				const choice = await ctx.ui.select("Select preset", choices);
				if (!choice) return;
				if (choice === "(none)") {
					clearPreset(ctx);
					return;
				}
				await applyPreset(choice, ctx);
				return;
			}

			if (input === "none" || input === "(none)") {
				clearPreset(ctx);
				return;
			}

			await applyPreset(input, ctx);
		},
	});

	pi.on("before_agent_start", async (event) => {
		if (!activePreset?.instructions) return;
		return {
			systemPrompt: `${event.systemPrompt}\n\n# Active Preset: ${activePresetName}\n\n${activePreset.instructions}`,
		};
	});

	pi.on("tool_call", async (event) => {
		if (activePreset?.bashMode !== "readonly") return;
		if (!isToolCallEventType("bash", event)) return;
		if (isReadOnlyCommand(event.input.command)) return;

		return {
			block: true,
			reason: `Preset \"${activePresetName}\" only allows read-only bash commands.\nCommand: ${event.input.command}`,
		};
	});

	pi.on("session_start", async (_event, ctx) => {
		const loaded = loadPresets(ctx.cwd);
		presets = loaded.presets;

		for (const diagnostic of loaded.diagnostics) {
			ctx.ui.notify(diagnostic, "warning");
		}

		const flag = pi.getFlag("preset");
		if (typeof flag === "string" && flag.trim()) {
			if (flag.trim() === "none") {
				clearPreset(ctx);
			} else {
				await applyPreset(flag.trim(), ctx);
			}
			return;
		}

		const presetEntry = ctx.sessionManager
			.getEntries()
			.filter((entry: { type: string; customType?: string }) => entry.type === "custom" && entry.customType === "preset-state")
			.pop() as { data?: { name?: string | null } } | undefined;

		const restoredName = presetEntry?.data?.name;
		if (!restoredName) {
			updateStatus(ctx);
			return;
		}

		await applyPreset(restoredName, ctx, { persist: false });
	});
}
