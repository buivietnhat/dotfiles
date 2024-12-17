return {
    {
       'preservim/nerdtree',
       config = function()
           -- Optional: set up keymaps or configurations
           vim.keymap.set('n', '<leader>ew', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
           vim.keymap.set('n', '<leader>ef', ':NERDTree<CR>', { noremap = true, silent = true })
           vim.keymap.set('n', '<leader>ee', ':NERDTreeFind<CR>', { noremap = true, silent = true })
       end,
       dependencies = {
           "ryanoasis/vim-devicons"
       }
    }
    -- {
    --     "ryanoasis/vim-devicons",
    --     lazy = false,
    --     dependencies = {
    --       "nvim-tree/nvim-web-devicons" -- Optional but works well
    --     }
    -- }
}
