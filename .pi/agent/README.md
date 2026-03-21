# pi agent layout

## Shared base
- `APPEND_SYSTEM.md`: always-on communication and code-style rules.

## Role overlays
- `contexts/coder.md`: autonomous coding mode.
- `contexts/teacher.md`: explanation and review mode.

## Preset switcher
- `presets.json`: defines the available modes.
- `extensions/preset.ts`: loads presets, appends the matching role file, and enforces read-only bash in teacher mode.

## Usage
- `pi --preset coder`
- `pi --preset teacher`
- `/preset`
- `/preset coder`
- `/preset teacher`

## Notes
- The old `SYSTEM.md` copy is gone. Pi keeps its default system prompt and appends `APPEND_SYSTEM.md`.
- Teacher mode keeps only `read` and `bash`, and its bash commands are limited to read-only inspection.
