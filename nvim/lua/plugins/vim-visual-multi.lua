return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			-- Set key mappings before the plugin is loaded
			vim.g.VM_maps = {
				["Find Under"] = "mc", -- Select next occurrence
				["Find Subword Under"] = "mc",
				["Remove Region"] = "mx", -- Deselect last added occurrence
				["Add Cursor Down"] = "<A-S-j>", -- Add cursor downward with Alt + Shift + j
				["Add Cursor Up"] = "<A-S-k>", -- Optional: Add cursor upward with Alt + Shift + k
			}
		end,
	},
}
