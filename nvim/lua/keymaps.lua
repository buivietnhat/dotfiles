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
vim.keymap.set('n', '<C-h>', '0', { noremap = true, silent = true })

vim.keymap.set('i', '<C-l>', '<C-o>$', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<C-o>0', { noremap = true, silent = true })

vim.keymap.set('v', '<C-l>', '$', { noremap = true, silent = true })
vim.keymap.set('v', '<C-h>', '0', { noremap = true, silent = true })

-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')

vim.keymap.set('n', '<c-;>', '<c-i>')

vim.keymap.set('n', ';', ':')

-- <leader>p will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
vim.keymap.set('n', '<leader>p', '<cmd>read !wl-paste<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>w !wl-copy<cr><cr>')