We use Homebrew because `apt` is either outdated (`fzf`) or does not provide some packages (`lazygit`, `lazydocker`).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install vim tmux fzf lazygit lazydocker tree ripgrep fd
```

Run `deploy.sh` to install the dotfiles. **It overwrites the target files and directories.**
