return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufWritePre",
        keys = {
            { "<leader>bf", "<cmd>lua vim.lsp.buf.format {async=true}<CR>", "Buffer Format" },
        },
        config = function()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            -- auto format on save
            local auto_format_on_save = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end

            local null_ls = require("null-ls")
            null_ls.setup({
                on_attach = auto_format_on_save,
                sources = {
                    null_ls.builtins.hover.dictionary,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.taplo,
                    null_ls.builtins.formatting.prettier.with({
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
                    }),
                },
            })

            vim.api.nvim_create_autocmd(
                { "BufNewFile", "BufRead" },
                { pattern = "*.mdx", command = "set filetype=markdown.mdx" }
            )
        end,
    },
}
