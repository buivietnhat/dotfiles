return {
	"NeogitOrg/neogit",
	version = "v0.0.1", -- Pin to v0.0.1 for Neovim 0.9 compatibility
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency
		"sindrets/diffview.nvim", -- Optional but recommended for diffs
	},
	config = function()
		require("neogit").setup({
			integrations = {
				diffview = true, -- Use Diffview for diffs
			},
		})

		vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { silent = true, desc = "Open Neogit" })
	end,
}
