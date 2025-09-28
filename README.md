````markdown
# Dotfiles

This repository contains my personal configuration files (dotfiles), managed using [GNU Stow](https://www.gnu.org/software/stow/).  
Stow makes it easy to keep all configs in one place and symlink them into `$HOME`.

---

## 📦 Setup

Clone into your home directory (recommended):
```bash
git clone git@github.com:yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
````

Install a specific config (example: Neovim):

```bash
stow nvim
```

Install all configs:

```bash
stow -R */
```

Dry-run (see what would happen without making changes):

```bash
stow -nv nvim
```

---

## ⚠️ Common Issues

### 1. `.config` folder structure

Configs inside `~/.config/` must mirror that directory inside the repo.
✅ Correct example:

```
~/.dotfiles/nvim/.config/nvim/init.lua
~/.dotfiles/zellij/.config/zellij/config.kdl
```

This way Stow creates:

```
~/.config/nvim -> ~/.dotfiles/nvim/.config/nvim
~/.config/zellij -> ~/.dotfiles/zellij/.config/zellij
```

❌ Wrong (extra `.config`):

```
~/.dotfiles/.config/nvim/init.lua
```

This would symlink to `~/.config/.config/nvim`, which is broken.

---

### 2. `.ssh` folder

⚠️ Never commit private keys!

Only symlink safe files like `~/.ssh/config`.
Sensitive files are ignored via `.gitignore`:

* `id_rsa`, `id_ed25519`, `*_key`, etc.
* `known_hosts`
* `authorized_keys`

✅ Example layout in repo:

```
~/.dotfiles/ssh/.ssh/config
```

Then:

```bash
stow ssh
```

creates:

```
~/.ssh/config -> ~/.dotfiles/ssh/.ssh/config
```

---

## 🛡️ Git Ignore

This repo includes a `.gitignore` that excludes SSH keys, known_hosts, and other sensitive files.
You should **only** commit safe, shareable configs.

---

## 💡 Tips

* If Stow refuses due to conflicts:

  ```bash
  mv ~/.config/nvim ~/.dotfiles/nvim/.config/nvim
  stow -R nvim
  ```
* For fast syncing across machines:

  ```bash
  git pull origin main
  stow -R */
  ```

---

## 📂 Structure Overview

```
~/.dotfiles/
├── nvim/         -> ~/.config/nvim/
│   └── .config/nvim/init.lua
├── zellij/       -> ~/.config/zellij/
│   └── .config/zellij/config.kdl
├── ssh/          -> ~/.ssh/
│   └── .ssh/config
└── zsh/          -> ~/.zshrc
```

---

## 🔗 References

* [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
* [Dotfiles Guide](https://wiki.archlinux.org/title/Dotfiles)
```
