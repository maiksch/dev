-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration
local config = {}

-- in newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- this is where you actually apply your config choices

-- colorscheme
config.color_scheme = "Monokai Pro (Gogh)"
config.colors = {
	background = "#282828",
	cursor_fg = "#19181A",
	cursor_bg = "#FBF1C7",
}
-- font
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.enable_tab_bar = true
-- disable font ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

local act = wezterm.action

config.keys = {
	{
		mods = "LEADER",
		key = "o",
		action = wezterm.action_callback(function(window, pane)
			local choices = { { label = "default", id = "~" } }
			local projects = wezterm.home_dir .. "/" .. "Projects"

			for _, path in ipairs(wezterm.read_dir(projects)) do
				local label = path:match("[^/\\]*$")

				if label ~= ".DS_STORE" then
					table.insert(choices, { label = label, id = path })
				end
			end

			table.sort(choices, function(a, b)
				return a.label < b.label
			end)

			window:perform_action(
				wezterm.action.InputSelector({
					action = wezterm.action_callback(function(window, pane, id, label)
						local current_workspace = window:active_workspace()

						window:perform_action(
							wezterm.action.SwitchToWorkspace({
								name = label,
								spawn = {
									label = "Workspace: " .. label,
									cwd = id,
								},
							}),
							pane
						)

						wezterm.GLOBAL.previous_workspace = current_workspace
					end),
					title = "Chose Workspace",
					fuzzy_description = "Fuzzy find Workspace: ",
					choices = choices,
					fuzzy = true,
				}),
				pane
			)
		end),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action_callback(function(window, pane)
			local previous_workspace = wezterm.GLOBAL.previous_workspace
			local current_workspace = window:active_workspace()

			window:perform_action(wezterm.action.SwitchToWorkspace({ name = previous_workspace }), pane)

			wezterm.GLOBAL.previous_workspace = current_workspace
		end),
	},
	{
		mods = "LEADER",
		key = "t",
		action = wezterm.action.SpawnTab("DefaultDomain"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		mods = "LEADER",
		key = "d",
		action = wezterm.action_callback(function(window, pane)
			open_workspace(window, pane, {
				name = "lazydocker",
				cwd = "/Users/mschmaddebeck/",
				--args = { "lazydocker" },
			})
		end),
	},
}

function open_workspace(window, pane, opts)
	local current_workspace = window:active_workspace()
	window:perform_action(
		wezterm.action.SwitchToWorkspace({
			name = opts.name,
			spawn = {
				label = "Workspace: " .. opts.name,
				cwd = opts.cwd,
				args = opts.args,
			},
		}),
		pane
	)
	wezterm.GLOBAL.previous_workspace = current_workspace
end

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return config
