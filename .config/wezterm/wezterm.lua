-- WezTerm config: matches the Terminal.app "Clear Dark" profile, with the kitty protocols enabled.
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Kitty protocols ------------------------------------------------------------

-- Kitty keyboard protocol. Apps that ask for it (herdr, Claude Code, neovim, ...)
-- get unambiguous keys: Esc vs Alt+key, Shift+Enter, Ctrl+I vs Tab, etc.
config.enable_kitty_keyboard = true
-- Kitty graphics protocol (inline images).
config.enable_kitty_graphics = true

-- Font -----------------------------------------------------------------------

-- Terminal.app ships SF Mono inside its bundle but does not install it system-wide,
-- so load it from there. Same font and size as the "Clear Dark" profile.
config.font_dirs = { '/System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts' }
config.font = wezterm.font 'SF Mono'
config.font_size = 18

-- Colors ---------------------------------------------------------------------

-- Taken from the Terminal.app "Clear Dark" profile, converted to sRGB.
config.colors = {
  foreground = '#e6e6e6',
  background = '#212734',

  cursor_bg = '#929292',
  cursor_fg = '#212734',
  cursor_border = '#929292',

  -- Keep the original text color when selecting, like Terminal.app.
  selection_fg = 'none',
  selection_bg = '#334e5e',

  ansi = {
    '#35424c', -- black
    '#b45648', -- red
    '#6caa71', -- green
    '#c4ac62', -- yellow
    '#6d96b4', -- blue
    '#bd7bcd', -- magenta
    '#7ccbcd', -- cyan
    '#dee5eb', -- white
  },
  brights = {
    '#465c6d', -- bright black
    '#df6c5a', -- bright red
    '#79be7e', -- bright green
    '#e5c872', -- bright yellow
    '#67b5ed', -- bright blue
    '#d389e5', -- bright magenta
    '#84dde0', -- bright cyan
    '#e5eff5', -- bright white
  },
}

-- Window ---------------------------------------------------------------------

-- Translucent, blurred background like "Clear Dark".
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

config.initial_cols = 120
config.initial_rows = 30

-- herdr handles tabs and splits, so hide WezTerm's tab bar with a single tab.
config.hide_tab_bar_if_only_one_tab = true

-- Terminal.app uses a thin margin around the text.
config.window_padding = { left = 4, right = 4, top = 2, bottom = 2 }

-- Behavior -------------------------------------------------------------------

config.default_cursor_style = 'SteadyBlock'
config.audible_bell = 'Disabled'

-- "Use Option as Meta key": both Option keys act as Alt instead of typing symbols.
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Option+Left/Right jump by word, like Terminal.app (which sends Alt+b / Alt+f).
config.keys = {
  { key = 'LeftArrow', mods = 'OPT', action = wezterm.action.SendKey { key = 'b', mods = 'ALT' } },
  { key = 'RightArrow', mods = 'OPT', action = wezterm.action.SendKey { key = 'f', mods = 'ALT' } },
}

return config
