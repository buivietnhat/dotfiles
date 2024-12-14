return {
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.5",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({}),
            },
          },
          defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
                n = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<C-o>", builtin.oldfiles, {})
  
        require("telescope").load_extension("ui-select")
      end,
    },
  }