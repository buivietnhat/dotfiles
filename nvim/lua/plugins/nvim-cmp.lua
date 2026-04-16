return 
{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
				--	['<C-b>'] = cmp.mapping.scroll_docs(-4),
				--	['<C-k>'] = cmp.mapping.scroll_docs(4),
          ['<A-j>'] = cmp.mapping.select_next_item(),  -- Move to the next item in the autocomplete menu
          ['<A-k>'] = cmp.mapping.select_prev_item(),  -- Move to the previous item in the autocomplete menu
					['<A-Space>'] = cmp.mapping.complete(),
					['<A-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
          ['<A-o>'] = cmp.mapping.confirm({ select = true }), -- Confirm the currently selected autocomplete item
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	}
