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
							["<C-o>"] = function(prompt_bufnr)
								local actions = require("telescope.actions")
								local action_state = require("telescope.actions.state")

								-- Get the current selected entry
								local entry = action_state.get_selected_entry()
								if entry then
									-- Open the selected file
									actions.select_default(prompt_bufnr)
								end
							end,
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
			vim.keymap.set("n", "<leader>fe", builtin.live_grep, {})
			vim.keymap.set("n", "<C-p>", function()
				builtin.oldfiles({
					only_cwd = true, -- Restricts to files in the current working directory
				})
			end, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
