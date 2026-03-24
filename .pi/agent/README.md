# pi agent layout

## Launchers
- `pit`: teacher profile for explanation, review, and planning.
  - tools: `read,grep,find,ls`
  - system prompt: `contexts/teacher-system.md`
  - appended rules: `APPEND_SYSTEM.md`
  - session dir: `~/.pi/sessions/teacher`
- `pic`: coder profile for implementation.
  - tools: `read,bash,edit,write`
  - system prompt: `contexts/coder-system.md`
  - appended rules: `APPEND_SYSTEM.md`
  - session dir: `~/.pi/sessions/coder`
- plain `pi`: unchanged generic entrypoint.
  - uses pi's default system prompt plus the discovered `APPEND_SYSTEM.md`

## Prompt files
- `APPEND_SYSTEM.md`: shared appended rules for `pi`, `pit`, and `pic`.
- `contexts/teacher-system.md`: system prompt for `pit`.
- `contexts/coder-system.md`: system prompt for `pic`.

## Legacy preset files
The preset-based workflow is no longer the recommended entrypoint.

Legacy files kept for follow-up cleanup:
- `contexts/coder.md`
- `contexts/teacher.md`
- `presets.json`
- `extensions/preset.ts`

## Notes
- `grep` is backed by `rg`.
- `find` is backed by `fd`.
- `pit` and `pic` reuse the shared `APPEND_SYSTEM.md` overlay instead of duplicating those rules in each system prompt file.
- `pit` and `pic` disable extension and skill discovery, so they do not load the preset extension.
- `AGENTS.md` loading is still enabled.
