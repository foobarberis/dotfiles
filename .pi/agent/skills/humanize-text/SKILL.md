---
name: humanize-text
description: Revises prose to sound natural, clear, and concise. Use when asked to humanize AI-sounding text, smooth awkward phrasing, remove filler, tighten wording, or cut useless sentences without changing meaning.
---

# Humanize Text

Use this skill when the user wants writing to sound less AI-generated and more natural.

## Intake

- If the user has not provided the text, ask for it.
- Respect any stated constraints: audience, tone, formality, region, length, format, banned terms, and must-keep phrasing.

## Goals

- Preserve meaning, facts, and intent.
- Make the text sound natural and competent, not polished into a different voice.
- Prefer plain, direct wording.
- Remove filler, repetition, clichés, generic transitions, and empty emphasis.
- Cut sentences that add no information.
- Keep the result clear and concise.
- Keep the original audience, tone, and formality unless the user asks to change them.

## Process

1. Read the full text before editing.
2. If missing context would materially change the rewrite, ask one short question. Otherwise proceed.
3. Rewrite with the fewest changes needed to improve flow, clarity, and brevity.
4. Preserve structure and formatting unless changing them clearly helps.
5. Recheck that no meaning, factual claim, or instruction was changed.

## Output

- Return the revised text first.
- Do not explain the edits unless the user asks.
- If the text is already strong, make a light edit rather than a full rewrite.
- Preserve headings, bullets, links, quotes, and code blocks.
- Only provide multiple versions when the user asks for options.

## Avoid

- Heavy-handed wording and inflated vocabulary.
- Stock AI phrasing such as "delve," "leverage," "robust," "seamless," "in order to," or "it is important to note" unless the context genuinely requires it.
- Awkward sentence balance, over-signposting, and summary lines that add nothing.
- Forced personality, slang, or humor unless requested.
- Making the text longer.
