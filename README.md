We use Homebrew because `apt` is either outdated (`fzf`) or does not provide some packages (`lazygit`, `lazydocker`).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install vim tmux fzf lazygit lazydocker tree ripgrep fd
```

Run `deploy.sh` to install the dotfiles. **It overwrites the target files and directories.**

## Berkeley Light theme

Inspired by the Berkeley color scheme for Anvil by 非公開:
https://anvil-editor.net/themes/

Core colors:
- background: white `#FFFFFF`
- foreground: black `#000000`
- muted: gray `#9A9A9A`
- green `#0A805D`
- orange `#E25600`
- gold `#FEB908`
- red `#B73A34`
- purple `#5F00B9`
- blue `#006EC3`

Design principles:
1. Keep the palette small. Use a background, a foreground, an optional muted neutral, and 4 to 5 accent colors.
2. Keep contrast high. Aim for at least WCAG AA (`4.5:1`) for text and background pairs when the theme controls both colors.
