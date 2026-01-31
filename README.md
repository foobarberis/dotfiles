# dotfiles

My personal configuration files for various tools and shells.

## Installation

### Prerequisites

On Debian/Ubuntu:

```bash
sudo apt-get install neovim tmux fzf ripgrep tree
```

On macOS (using Homebrew):

```bash
brew install neovim tmux fzf ripgrep tree
```

### Deployment

To deploy the configuration files to your home directory, run the provided deployment script:

```bash
./deploy.sh
```

**Warning:** This script will overwrite existing configuration files in your `$HOME` directory.

## Contents

### Shell & Terminal

- **Bash**: `.bashrc` (copied to `.profile` and `.bash_profile`).
- **Tmux**: `.config/tmux/tmux.conf`.
- **Ghostty**: `.config/ghostty/config`.
- **Git**: `.gitignore`.

### Editors

- **Vim/Neovim**: `.vimrc` (copied to both `~/.vimrc` and `~/.config/nvim/init.vim`).
- **Emacs**: Configuration in `.emacs.d/`.

### Custom Scripts

Located in `.local/bin/`:

- `git-prompt`: Custom Git prompt for Bash.

### AI Configuration (Gemini CLI)

Configuration and context files for the Gemini CLI, located in `ai/.gemini/`:

- `GEMINI.md`: Core instructions and project context.
- `settings.json`: CLI settings.
- `context/`: Specific context files (User, Work, School).

### Miscellaneous

- **SSH**: `.ssh/config` for managing SSH connections.
- **MPV**: `.config/mpv/mpv.conf` for media player settings.