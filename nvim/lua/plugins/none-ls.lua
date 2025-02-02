return {

	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				--      -- JavaScript/TypeScript
				--      null_ls.builtins.formatting.prettier,

				--      -- Ruby
				--      null_ls.builtins.diagnostics.erb_lint,
				--      null_ls.builtins.diagnostics.rubocop,
				--      null_ls.builtins.formatting.rubocop,

				-- C++
				--        null_ls.builtins.formatting.clang_format,
				--        null_ls.builtins.diagnostics.cppcheck,

				-- Java
				null_ls.builtins.formatting.google_java_format,
				--        null_ls.builtins.diagnostics.checkstyle.with({
				--          extra_args = { "-c", "/google_checks.xml" },
				--        }),

				--      -- Python
				--      null_ls.builtins.formatting.black,
				--      null_ls.builtins.diagnostics.flake8,

				--      -- Go
				--      null_ls.builtins.formatting.gofmt,
				--      null_ls.builtins.diagnostics.golangci_lint,
			},
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({ bufnr = bufnr })
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
