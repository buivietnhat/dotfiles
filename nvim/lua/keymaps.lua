vim.keymap.set('n', '<C-w>h', function()
    if vim.fn.winnr() == 1 then
        vim.cmd('wincmd l')
    else
        vim.cmd('wincmd h')
    end
end, { noremap = true, silent = true })

-- Move focus to the right window
vim.keymap.set('n', '<C-w>l', function()
    if vim.fn.winnr() == vim.fn.winnr('$') then
        vim.cmd('wincmd h')
    else
        vim.cmd('wincmd l')
    end
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-l>', '$', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '^', { noremap = true, silent = true })

vim.keymap.set('i', '<C-l>', '<C-o>$', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<C-o>^', { noremap = true, silent = true })

vim.keymap.set('v', '<C-l>', '$', { noremap = true, silent = true })
vim.keymap.set('v', '<C-h>', '^', { noremap = true, silent = true })

-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')

vim.keymap.set('n', '<c-;>', '<c-i>')

vim.keymap.set('n', ';', ':')

-- <leader>v will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
vim.keymap.set('n', '<leader>v', '<cmd>read !xclip -o -selection clipboard<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>w !xclip -i -selection clipboard<cr><cr>')

-- <leader>c in visual mode will copy the selected text into clipboard
vim.keymap.set('v', '<leader>c', ':"<C-u>y<CR>:call system("xclip -selection clipboard", @0)<CR>', { noremap = true, silent = true })

-- quick-save
vim.keymap.set('n', '<leader>s', '<cmd>w<cr>')

--vim.keymap.set('n', 'J', 'G')
--vim.keymap.set('n', 'K', 'gg')

-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- -- C-[ to go back
-- vim.api.nvim_set_keymap('n', '<C-[>', '<C-o>', { noremap = true, silent = true })
-- -- C-] to go next
-- vim.api.nvim_set_keymap('n', '<C-]>', '<C-i>', { noremap = true, silent = true })

-- vim.keymap.set('n', '<a-[>', '<c-o>')
-- vim.keymap.set('n', '<a-]>', '<c-i>')