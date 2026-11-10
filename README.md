# dotfile
Dot files for my zsh and WezTerm (macOS, Apple Silicon)

## Setup on a new Mac

```sh
# Homebrew: https://brew.sh
brew install fzf z nvm
brew install --cask wezterm

git clone https://github.com/loganwang22/dotfile.git ~/Projects/dotfile
mkdir -p ~/.config
ln -s ~/Projects/dotfile/.zshrc ~/.zshrc
ln -s ~/Projects/dotfile/.config/wezterm ~/.config/wezterm
```

If `~/.zshrc` or `~/.config/wezterm` already exists, move it out of the way before the `ln` step.
Then open a new shell, and restart WezTerm (Cmd+Q and reopen).

## What's here

- `.zshrc` - Homebrew, prompt with git branch, `ll`, z, fzf, nvm.
- `.config/wezterm/wezterm.lua` - matches the Terminal.app "Clear Dark" profile (SF Mono 18pt, same colors) and enables the kitty keyboard and graphics protocols.
