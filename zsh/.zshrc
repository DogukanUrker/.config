# ============================================================================
# ZSH Configuration
# ============================================================================

# ============================================================================
# Environment Setup
# ============================================================================

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Local environment
. "$HOME/.local/bin/env"

# ============================================================================
# Language & Runtime Managers
# ============================================================================

# Python & Pyenv
alias python=python3.13
alias pip=pip3.13
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/dogukanurker/.bun/_bun" ] && source "/Users/dogukanurker/.bun/_bun"

# ============================================================================
# PATH Additions
# ============================================================================

# LM Studio CLI
export PATH="$PATH:/Users/dogukanurker/.lmstudio/bin"

# ============================================================================
# External Integrations
# ============================================================================

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Google Cloud SDK
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# ============================================================================
# ZSH Plugins & Enhancements
# ============================================================================

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# TheFuck - Command Correction
eval "$(thefuck --alias)"

# ============================================================================
# Prompt Configuration
# ============================================================================

export PROMPT="%F{cyan}%1~%f ➜ "

# ============================================================================
# Aliases
# ============================================================================

# File Listing (eza)
alias ls='eza -a --icons'
alias lt='eza --tree --icons'
alias lg='eza -la --git --icons'

# Docker Management
alias dc="docker system prune -af --volumes && docker network prune -f && docker volume prune -f"

# Homebrew Maintenance
alias brewup="brew update && brew upgrade && brew upgrade --cask && brew autoremove && brew cleanup -s && rm -rf \"\$(brew --cache)\" && brew doctor"

# Git Rebase
alias gr='current_branch=$(git branch --show-current) && \
  git fetch origin && \
  git rebase origin/main && \
  git push --force'
