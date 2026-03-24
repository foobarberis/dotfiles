# dotfiles

# Dependencies and deployment

We use Homebrew because `apt` is either outdated (`fzf`) or does not provide some packages (`lazygit`, `lazydocker`).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install tmux fzf lazygit lazydocker tree ripgrep fd
```

Run `deploy.sh` to install the dotfiles. **It overwrites the target files and directories.**

## Building Vim

I build Vim from source to control which features are enabled. I use the following steps:

1. Clone the repository:

```sh
git clone https://github.com/vim/vim.git
cd vim
```

2. If I am reusing an existing source tree, remove old build artifacts:

```sh
make distclean
rm -f src/auto/config.cache
```

3. List the available releases and check out the version I want to build:

```sh
git fetch --tags
git tag
git checkout <tag>
```

4. Review the available configure options if needed:

```sh
./configure --help
```

Linux/X11:

```sh
 ./configure \
   --with-features=normal \
   --enable-gui=no \
   --with-x \
   --without-wayland \
   --enable-cscope=no \
   --disable-netbeans \
   --disable-channel \
   --enable-terminal=no \
   --enable-socketserver=no \
   --disable-rightleft \
   --disable-arabic \
   --disable-xsmp \
   --disable-nls \
   --disable-acl \
   --disable-selinux \
   --disable-xattr \
   --enable-gpm=no \
   --disable-sysmouse \
   --without-local-dir
```

 macOS:

```sh
 ./configure \
   --with-features=normal \
   --enable-gui=no \
   --without-x \
   --without-wayland \
   --enable-cscope=no \
   --disable-netbeans \
   --disable-channel \
   --enable-terminal=no \
   --enable-socketserver=no \
   --disable-rightleft \
   --disable-arabic \
   --disable-xsmp \
   --disable-nls \
   --disable-acl \
   --without-local-dir
```

5. Build:

```sh
make -j6
```
