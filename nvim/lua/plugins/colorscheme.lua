return {
	-- "wincent/base16-nvim",
	-- lazy = false, -- load at start
	-- priority = 1000, -- load first
	-- config = function()
	-- 	vim.cmd([[colorscheme gruvbox-dark-hard]])
	-- 	vim.o.background = "dark"
	-- 	-- XXX: hi Normal ctermbg=NONE
	-- 	-- Make comments more prominent -- they are important.
	-- 	local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
	-- 	vim.api.nvim_set_hl(0, "Comment", bools)
	-- 	-- vim.api.nvim_set_hl(0, "Comment", { ctermfg = 6 })
	-- 	-- vim.api.nvim_set_hl(0, "Repeat", { ctermfg = 5 })
	-- 	-- vim.api.nvim_set_hl(0, "StorageClass", { ctermfg = 5 })
	-- 	-- -- vim.api.nvim_set_hl(0, "Macro", { ctermfg = 3 })
	-- 	-- vim.api.nvim_set_hl(0, "Identifier", { ctermfg = 3 })
	-- 	-- vim.api.nvim_set_hl(0, "Character", { ctermfg = 3 })
	-- 	vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = 0, ctermbg = 0 })
	-- 	vim.api.nvim_set_hl(0, "LineNr", { ctermfg = 8, ctermbg = 0 })
	-- 	vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = 12, bold = true })
	-- 	vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = NONE })
	-- 	-- Make it clearly visible which argument we're at.
	-- 	local marked = vim.api.nvim_get_hl(0, { name = "PMenu" })
	-- 	vim.api.nvim_set_hl(
	-- 		0,
	-- 		"LspSignatureActiveParameter",
	-- 		{ fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true }
	-- 	)
	-- end,
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({})
			vim.cmd("colorscheme github_dark_dimmed")

			vim.api.nvim_set_hl(0, "Comment", { fg = "#6bc46d" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#636e7b", bg = "NONE" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#6cb6ff", bg = "#2d333b", bold = true })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2d333b" })

			-- Make it clearly visible which argument we're at.
			local marked = vim.api.nvim_get_hl(0, { name = "PMenu" })
			vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = marked.fg, bg = marked.bg, bold = true })
		end,
	},
}
