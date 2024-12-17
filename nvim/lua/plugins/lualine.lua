return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox", -- Use the base16 theme
					disable_not_found = true, -- Disable warnings about missing themes
				},
			})
		end,
	},
}
