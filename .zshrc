# Homebrew (sets PATH and $HOMEBREW_PREFIX, so it must come first)
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | cut -c 1-20
}
# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%F{magenta}local%F{green}%~%F{yellow}$(parse_git_branch)%F{white}%# '

# Alias
alias ll="ls -alh"

# z
source "$HOMEBREW_PREFIX/etc/profile.d/z.sh"

# fzf key bindings and fuzzy completion
source <(fzf --zsh)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# Upgrade Claude Code to the latest version before launching it.
# Uses `command claude` to call the real binary (avoids the function calling itself).
claude() {
	brew upgrade --cask claude-code@latest
	command claude "$@"
}
