return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
	config = function()
		require("diffview").setup()

		vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { silent = true, desc = "Open Diffview" })
		vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { silent = true, desc = "Close Diffview" })
	end,
}
