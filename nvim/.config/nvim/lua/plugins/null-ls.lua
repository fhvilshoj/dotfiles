return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		event = "BufWritePre",
		keys = {
			{ "<leader>bf", "<cmd>lua vim.lsp.buf.format {async=true}<CR>", "Buffer Format" },
			{ "<leader>bd", "<cmd>lua require('null-ls').diagnostics.show()<CR>", "Show Diagnostics" },
		},
		config = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

			-- Setup mason-null-ls bridge first to resolve paths
			require("mason-null-ls").setup({
				automatic_setup = false, -- We're manually configuring sources
			})

			local null_ls = require("null-ls")
			
			-- Configure prettier source with markdown support
			-- mason-null-ls will automatically resolve the path to Mason's prettier
			local prettier_source = null_ls.builtins.formatting.prettier.with({
				prefer_local = "node_modules/.bin",
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"css",
					"scss",
					"less",
					"html",
					"json",
					"jsonc",
					"yaml",
					"markdown",
					"markdown.mdx",
					"graphql",
					"handlebars",
					"telekasten",
				},
			})

			null_ls.setup({
				sources = {
					null_ls.builtins.hover.dictionary,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
					-- null_ls.builtins.formatting.stylua,
					prettier_source,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- Format with null-ls
								vim.lsp.buf.format({
									bufnr = bufnr,
									async = false,
									filter = function(c)
										return c.name == "null-ls"
									end,
								})
							end,
						})
					end
				end,
			})

			vim.api.nvim_create_autocmd(
				{ "BufNewFile", "BufRead" },
				{ pattern = "*.mdx", command = "set filetype=markdown.mdx" }
			)
		end,
	},
}
