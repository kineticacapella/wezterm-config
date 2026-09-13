local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- General Settings
config.front_end = "OpenGL"
config.window_background_opacity = 0.85

-- Font Configuration
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14.0

-- Window Layout
window_padding = {
  left = 2,
  right = 2,
  bottom = 2,
  top = 2, 
}

-- Tab Bar Setup
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 32
config.tab_bar_at_bottom = false

-- Tab Title
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  local index = tab.tab_index + 1

  if tab.is_active then
    return {
      { Attribute = { Intensity = 'Bold' } },
      { Foreground = { Color = '#52ad70' } },
      { Text = '   ● ' .. index .. ': ' .. title .. '   ' },
    }
  end

  return {
    { Text = '     ' .. index .. ': ' .. title .. '   ' },
  }
end)

-- Colour Scheme
config.colors = wezterm.color.get_default_colors()

config.colors.tab_bar = {
  background = 'rgba(0, 0, 0, 0.85)',

  -- Inactive Tabs
  inactive_tab = {
    bg_color = 'rgba(0, 0, 0, 0.85)',
    fg_color = '#555555',
  },
  
  inactive_tab_hover = {
    bg_color = 'rgba(0, 0, 0, 0.85)',
    fg_color = '#555555',
  },

  -- Active Tab
  active_tab = {
    bg_color = '#000000',
    fg_color = '#ffffff',
  },

  -- Hide Retro Mode '+' Button
  new_tab = {
    bg_color = 'rgba(0, 0, 0, 0.85)',
    fg_color = 'rgba(0, 0, 0, 0)',
  },
  
  new_tab_hover = {
    bg_color = 'rgba(0, 0, 0, 0.85)',
    fg_color = 'rgba(0, 0, 0, 0)',
  },
}

return config
