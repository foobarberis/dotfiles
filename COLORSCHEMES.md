# Colorschemes

Mirage Raceway and Midnight are companion themes.
- Mirage Raceway is the light variant.
- Midnight is the dark variant.

They should share the same design rules and the same semantic use of color and typography. The main difference should be light versus dark, not a different visual language.

## Shared philosophy

- Keep the palette small.
- Keep contrast high.
- Avoid pure black and pure white when possible.
- Keep statuslines and UI chrome quiet.
- Use accent colors for meaning, not decoration.
- Prefer bold and oblique before adding more color.
- Use solid color fills mainly for temporary interactive states.

## Midnight (dark, WIP)

Palette:
- background `#10141B`
- foreground `#F4F1E8`
- purple `#806CE5`
- gold `#FEB908`
- slate `#8A94A6`
- ember `#E38B5B`

Midnight should follow the same semantic rules as Mirage Raceway, adapted for a dark background.

## Mirage Raceway (light)

Mirage Raceway is a matte, muted, paper-like theme with minimal chrome and strong text contrast.

Goals:
- avoid pure white and pure black
- avoid large decorative color blocks
- rely on whitespace, thin separators, and typography for structure

Typography:
- regular for default text
- oblique for secondary, contextual, or de-emphasized text
- bold for focus, headings, and strong status emphasis

Palette:
- white `#F7F4EE`
- black `#1E1B18`
- green `#0A7F5D`
- blue `#006EC3`
- orange `#CB3F00`
- red `#B73A34`

Design principles:
1. Use only these six colors.
2. Prefer paper/ink contrast over decorative fills.
3. Use accent colors semantically and sparingly.
4. Prefer bold and oblique before adding more visual noise.
5. Keep statuslines and UI chrome minimal.
6. Keep text contrast high.

## Semantic guidelines

Across Vim, tmux, and Alacritty, use three layers:
1. color for broad meaning
2. font style and weight for emphasis
3. background fill for temporary state

Keep the same role across all applications, even if the exact implementation differs.

### Typography

- regular: default content
- oblique: secondary, contextual, inactive, de-emphasized
- bold: current, focused, selected, active, strong emphasis

In Vim, oblique is implemented with `italic`.

### Color roles

For Mirage Raceway:
- neutral text and chrome: black on white
- structural or positive: green
- informational, referential, or searchable: blue
- attention, current state, change, or selection: orange
- error, danger, or destructive state: red

Midnight should define matching roles for its own palette.

### Background fills

Use colored backgrounds mainly for temporary interactive states:
- selection
- search matches
- current search match
- selected menu item
- diff blocks
- warnings and errors that need strong emphasis

Do not use strong accent backgrounds for persistent chrome unless the state is intentionally important.

## Design rules for future themes

- Start from neutral foreground and background.
- Make most text neutral.
- Use accent colors only when they add meaning.
- Use typography to reduce color load.
- Keep one color for information, one for attention, one for error, and one for positive or structural meaning.
- Make current and selected states easy to spot.
- Keep inactive and secondary content quieter than primary content.
- If a color has a role in one app, keep that role in the others.
