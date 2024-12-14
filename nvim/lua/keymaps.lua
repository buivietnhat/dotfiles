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

