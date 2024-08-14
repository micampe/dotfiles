local wt = require 'wezterm'
local config = wt.config_builder()

local function move_pane(key, direction)
  return {
    key = key,
    mods = 'LEADER',
    action = wt.action.ActivatePaneDirection(direction),
  }
end

config.color_scheme = 'Quiet'
config.bold_brightens_ansi_colors = false

config.font = wt.font({ 
  family = 'Input Mono',
})
config.font_size = 13
config.line_height = 1.18

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.initial_rows = 40
config.initial_cols = 120
config.use_resize_increments = true
config.window_padding = {
  left = 8,
  right = 8,
  top = 2,
  bottom = 2,
}

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.8,
}

config.leader = {
  key = 's',
  mods = 'CTRL',
  timeout_milliseconds = 1000 
}

config.keys = {
  {
    key = ',',
    mods = 'SUPER',
    action = wt.action.SpawnCommandInNewWindow {
      cwd = wt.config_dir,
      args = { os.getenv('SHELL'), '-c', 'hx $WEZTERM_CONFIG_FILE' },
    },
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = wt.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wt.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  move_pane('h', 'Left'),
  move_pane('l', 'Right'),
  move_pane('k', 'Up'),
  move_pane('j', 'Down'),
}

return config
