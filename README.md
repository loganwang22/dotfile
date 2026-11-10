# dotfile
Dot files for my zsh and WezTerm

Initialize
1. install zsh wget https://raw.githubusercontent.com/rupa/z/master/z.sh
2. install fzf 
         git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
         ~/.fzf/install
         (optional) maybe need to uninstall old version of fzf by running `sudo apt-get remove --purge fzf`

## WezTerm (macOS)

Matches the Terminal.app "Clear Dark" profile (SF Mono 18pt, same colors) and enables the kitty keyboard and graphics protocols.

```sh
brew install --cask wezterm
git clone https://github.com/loganwang22/dotfile.git ~/Projects/dotfile
mkdir -p ~/.config
ln -s ~/Projects/dotfile/.config/wezterm ~/.config/wezterm
```

Then restart WezTerm (Cmd+Q and reopen). If `~/.config/wezterm` already exists, move it out of the way first.

