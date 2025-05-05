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
-- disable tab bar
config.enable_tab_bar = true
-- disable font ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.keys = {
	{
		mods = "CTRL|SHIFT",
		key = "i",
		action = wezterm.action_callback(function(window, pane)
			local projects = wezterm.home_dir .. "/" .. "Projects"

			local choices = {
				{ label = "Core", id = projects .. "/core" },
				{ label = "App Platform", id = projects .. "/vi-app-platform" },
			}

			--local res = io.popen("find ~/Projects -mindepth 1 -maxdepths 1 -type d | sort -r")
			--local text = res:read("*a")
			--wezterm.log_info(text)
			--res:close()

			window:perform_action(
				wezterm.action.InputSelector({
					action = wezterm.action_callback(function(window, pane, id, label)
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
					end),
					title = "Chose Workspace",
					fuzzy_description = "Fuzzy find Workspace: ",
					choices = choices,
					fuzzy = true,
				}),
				pane
			)
		end),

		--if [ -z $1 ]; then
		--locations=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d | sort -r)
		--session=$(echo "$locations" | fzf) # use fzf to show all possible locations
		--session_name=$(basename "$session" | tr . _) # remove file endings. remove dir path. replace . with _
		--else
		--session=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d -name $1)
		--session_name=$(echo $1 | tr . _)
		--echo $session_name
		--fi

		--if ! tmux has-session -t "$session_name" &> /dev/null; then
		--tmux new-session -s "$session_name" -c "$session" -d
		--fi

		--tmux switch-client -t "$session_name"
	},
}

return config
