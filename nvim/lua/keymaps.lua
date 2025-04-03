vim.keymap.set("n", "<C-w>h", function()
	if vim.fn.winnr() == 1 then
		vim.cmd("wincmd l")
	else
		vim.cmd("wincmd h")
	end
end, { noremap = true, silent = true })

-- Move focus to the right window
vim.keymap.set("n", "<C-w>l", function()
	if vim.fn.winnr() == vim.fn.winnr("$") then
		vim.cmd("wincmd h")
	else
		vim.cmd("wincmd l")
	end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "^", { noremap = true, silent = true })

vim.keymap.set("i", "<C-l>", "<C-o>$", { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", "<C-o>^", { noremap = true, silent = true })

vim.keymap.set("v", "<C-l>", "$", { noremap = true, silent = true })
vim.keymap.set("v", "<C-h>", "^", { noremap = true, silent = true })

-- <leader><leader> toggles between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

vim.keymap.set("n", ";", ":")

-- <leader>v will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
vim.keymap.set("n", "<leader>v", "<cmd>read !xclip -o -selection clipboard<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>w !xclip -i -selection clipboard<cr><cr>")

-- <leader>c in visual mode will copy the selected text into clipboard
vim.keymap.set(
	"v",
	"<leader>c",
	'y:call system("xclip -selection clipboard", getreg("@"))<CR>',
	{ noremap = true, silent = true }
)

-- quick-save
vim.keymap.set("n", "<leader>s", "<cmd>w<cr>")

--vim.keymap.set('n', 'J', 'G')
--vim.keymap.set('n', 'K', 'gg')

-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- C-s to stop searching
vim.keymap.set("v", "<C-s>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<A-w>", "yiw")
vim.keymap.set("n", "<A-p>", '"0p')

-- the % is a bit hard to press
vim.keymap.set("n", "-", "%")
vim.keymap.set("v", "-", "%")
vim.keymap.set("o", "-", "%")

-- Remap Ctrl-i to work like Ctrl-o (jump back)
vim.keymap.set("n", "<C-i>", "<C-o>")

-- Remap Ctrl-b to work like Ctrl-i (jump forward)
vim.keymap.set("n", "<C-b>", "<C-i>")

-- Quick duplicate
vim.keymap.set("n", "<A-d>", "yyp")

-- Quick delete
vim.keymap.set("n", "D", "d$")

-- always center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })

-- vim.keymap.set("n", "<C-o>", "<C-o>zz", { silent = true })

-- no arrow keys --- force yourself to use the home row
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bn<cr>")

-- resize panes
vim.keymap.set("n", "<C-w><Right>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-w><Left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-w><Up>", ":resize +5<CR>")
vim.keymap.set("n", "<C-w><Down>", ":resize -5<CR>")
