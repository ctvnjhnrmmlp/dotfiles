# Dotfiles

_Your personal configuration environment — powered by `stow` & designed for portability._

> A curated collection of configuration files (dotfiles) to set up and maintain a consistent development environment across machines.

## Overview

This repository helps you **quickly bootstrap and sync** your development environment across Linux/macOS systems using symlinks managed by **GNU Stow**.

Included configurations:

- Zsh with Powerlevel10k
- Tmux
- Git
- WezTerm
- VSCode
- `.config` files
- Other dev tool preferences

## Why Dotfiles?

Keeping your configuration files in sync is essential for a productive workflow.

This project solves that by:

- Automating symlink creation via `stow`
- Supporting modular configurations for various tools
- Keeping your dotfiles clean, version-controlled, and shareable

## Features

- Easy setup using `stow`
- Beautiful Zsh prompt with `powerlevel10k`
- Smart defaults for Git, Tmux, WezTerm, and more
- Organized `.config/` directory for modern apps
- Fast reinstallation on new machines

## Packages

### Install `stow` (dependency)

For Fedora:

```bash
sudo dnf install stow
```

For Ubuntu/Debian:

```bash
sudo apt install stow
```

For macOS:

```bash
brew install stow
```

## Installation

### Step 1: Clone this repository into your `$HOME` directory

```bash
git clone git@github.com-ctvnjhnrmmlp/ctvnjhnrmmlp/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Step 2: Use GNU Stow to symlink the packages

Symlink all packages:

```bash
for package in */; do stow "$package"; done
```

Or forcibly adopt existing files (use with caution):

```bash
for package in */; do stow -v --adopt "$package"; done
```

Symlink `.config` contents explicitly:

```bash
stow -v -t ~/.config .config
```

## Directory Structure

```bash
dotfiles/
├── .config/       # Configs for apps like nvim, wezterm, etc.
├── git/           # Git settings
├── zsh/           # Zsh and powerlevel10k configs
├── tmux/          # Tmux config
├── wezterm/       # WezTerm settings
└── ...
```

## Customizing

Feel free to:

- Add/remove tools you use
- Extend `.config` folder with your app configs
- Customize themes, aliases, and keybindings

Use `stow -D <package>` to remove any symlinked config.

## Roadmap

- [x] Add base configurations for Git, Zsh, and Tmux
- [x] Integrate Powerlevel10k theme
- [x] Modularize with `stow`
- [x] Add Neovim and VSCode config
- [ ] Add macOS and WSL-specific setup script

## Contributing

Suggestions, fixes, and improvements are welcome!

1. Fork this repo
2. Create a new branch: `git checkout -b feature/your-feature`
3. Commit and push: `git push origin feature/your-feature`
4. Open a pull request

## License

This project is licensed under the [MIT License](LICENSE).

## Credits

- Inspired by [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Holman](https://github.com/holman/dotfiles), and other dotfile ninjas.
- Built by [ctvnjhnrmmlp](https://github.com/ctvnjhnrmmlp)

