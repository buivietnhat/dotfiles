return {
	-- Plugin specification for Lazy.nvim
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

      require('java').setup()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "<C-Shift-b>", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "<C-o>", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<A-i>", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					-- vim.keymap.set("n", "<leader>f", function()
					-- 	vim.lsp.buf.format({ async = true })
					-- end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
					-- *and* there's some way to make it only apply to the current line.
					-- if client.server_capabilities.inlayHintProvider then
					--     vim.lsp.inlay_hint(ev.buf, true)
					-- end

					-- None of this semantics tokens business.
					-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})

			-- Define capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- Setup clangd with custom on_attach and capabilities
			lspconfig.clangd.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
					on_attach(client, bufnr)
				end,
				capabilities = capabilities,
			})

			-- Optionally, configure other LSP servers
			lspconfig.pyright.setup({})

			-- Set up JDTLS for Java
			lspconfig.jdtls.setup({
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
			},
      automatic_isntallation = true
		},
	},
}
