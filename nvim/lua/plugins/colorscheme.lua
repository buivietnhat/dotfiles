return {
	"wincent/base16-nvim",
	lazy = false, -- load at start
	priority = 1000, -- load first
	config = function()
		vim.cmd([[colorscheme gruvbox-dark-hard]])
		vim.o.background = "dark"
		-- Make comments more prominent -- they are important.
		local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
		vim.api.nvim_set_hl(0, "Comment", bools)
		vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = 0, ctermbg = 0 })
		vim.api.nvim_set_hl(0, "LineNr", { ctermfg = 8, ctermbg = 0 })
		vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = 12, bold = true })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282828", ctermbg = 235 })
		-- Make it clearly visible which argument we're at.
		local marked = vim.api.nvim_get_hl(0, { name = "PMenu" })
		vim.api.nvim_set_hl(
			0,
			"LspSignatureActiveParameter",
			{ fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true }
		)
	end,
}
