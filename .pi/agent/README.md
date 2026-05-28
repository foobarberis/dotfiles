# pi agent layout

## Global prompt
- plain `pi` uses `~/.pi/agent/SYSTEM.md`
- source file in this repo: `.pi/agent/SYSTEM.md`
- this stays as `SYSTEM.md` because pi uses `AGENTS.md` as a separate context-file layer, not as a system-prompt replacement

## Skills
- `skills/humanize-text`: rewrites prose to sound natural, clear, and concise
- `skills/grill-me`: grills a plan or design question-by-question until decisions are resolved

## Deployment
- `deploy.sh` copies `.pi/agent/SYSTEM.md` to `~/.pi/agent/SYSTEM.md`
- `deploy.sh` copies each repo skill under `.pi/agent/skills/` into `~/.pi/agent/skills/`
- `deploy.sh` removes old launcher-era files such as `~/.pi/agent/APPEND_SYSTEM.md` and `~/.pi/agent/contexts/`

## Notes
- `AGENTS.md` loading is still enabled
- skills are discovered from `~/.pi/agent/skills/`
