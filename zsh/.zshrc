# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# # Created by Zap installer
# [ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
# plug "zsh-users/zsh-autosuggestions"
# plug "zsh-users/zsh-history-substring-search"
# plug "zsh-users/zsh-syntax-highlighting"
# plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
# plug "zap-zsh/vim"
# plug "zap-zsh/nvm"
# plug "zap-zsh/completions"
# plug "atoftegaard-git/zsh-omz-autocomplete"
# plug "romkatv/powerlevel10k"
# plug "hlissner/zsh-autopair"
# plug "MAHcodes/distro-prompt"
# plug "Aloxaf/fzf-tab"
# plug "kutsan/zsh-system-clipboard"

# # Load and initialise completion system
# autoload -Uz compinit
# compinit

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# # pnpm
# export PNPM_HOME="/home/rayleigh/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end
# . "/home/rayleigh/.deno/env"
# # bun completions
# [ -s "/home/rayleigh/.bun/_bun" ] && source "/home/rayleigh/.bun/_bun"

# # bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
