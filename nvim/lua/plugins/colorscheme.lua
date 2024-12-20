return {
    "wincent/base16-nvim",
    lazy = false, -- load at start
    priority = 1000, -- load first
    config = function()
        vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
        vim.o.background = 'dark'
        -- XXX: hi Normal ctermbg=NONE
        -- Make comments more prominent -- they are important.
        local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
        vim.api.nvim_set_hl(0, 'Comment', bools)
        -- Make it clearly visible which argument we're at.
        local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
        vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {})
    end
}
