return {
	"numToStr/Comment.nvim",
	event = "BufEnter", -- Lazy load on file open
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<leader>/", -- Toggle line comment
				-- block = "<leader>.", -- Toggle block comment
			},
			opleader = {
				line = "<leader>,",
				block = "<leader>.",
			},
			mappings = {
				-- Enable visual mode support
				basic = true,
				extra = true,
			},
		})
	end,
}
