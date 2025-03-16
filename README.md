# Dotfiles

## Packages

### Stow

```
sudo dnf install stow
```

## Installation

Clone this repo inside the $HOME directory

```
git clone git@github.com-ctvnjhnrmmlp/ctvnjhnrmmlp/dotfiles.git
cd dotfiles
```

then use GNUW stow to create symlinks

```
for package in */; do stow "$package"; done
```

or forcefully stow them

```
for package in */; do stow -v --adopt "$package"; done
```

stow .config explicitly

```
stow -v -t ~/.config .config

```

## Test
