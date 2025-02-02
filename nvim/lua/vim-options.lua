vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.o.showmode = false

vim.wo.number = true -- Absolute line numbers
vim.wo.relativenumber = true -- Relative line numbers

-- keep more context on screen while scrolling
vim.opt.scrolloff = 2

-- case-insensitive search/replace
vim.opt.ignorecase = true

-- unless uppercase in search term
vim.opt.smartcase = true

-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = "yes"

-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true

--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	command = "silent! lua vim.highlight.on_yank({ timeout = 300 })",
})

-- jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function(ev)
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			-- except for in git commit messages
			-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})

--  produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "mail",
	group = email,
	command = "setlocal formatoptions+=w",
})

-- -- Auto-save when leaving insert mode
-- vim.cmd('autocmd InsertLeave * silent! write')
--
-- -- Auto-save when text is changed
-- vim.cmd('autocmd TextChanged,TextChangedI * silent! write')

-- Auto format when save
-- Add this to your `init.lua` or equivalent Neovim config file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*", -- Apply to all files; customize with file types (e.g., *.lua)
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

