-- ~/.config/nvim/lua/plugins/noice.lua

return {
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline", -- This sets the command line to the traditional bottom position
			},
			-- You might also want to disable the command_palette preset if it's interfering
			-- with your desired behavior for command line completions:
			presets = {
				command_palette = false,
			},
		},
	},
}
