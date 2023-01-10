local keymap = vim.keymap.set

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- [[ Formatters ]]
--
-- also format mdx
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.mdx", command = "set filetype=markdown.mdx" })

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
keymap("n", "<leader>tt", "<cmd>lua vim.lsp.buf.format {async=true}<CR>")

-- [[ Auto Completion ]]
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").pyright.setup({
    capabilities = capabilities,
})
require("lspconfig").sumneko_lua.setup({
    capabilities = capabilities,
})

-- [[ Lsp Saga ]]
keymap("n", "<leader>fu", "<cmd>Lspsaga lsp_finder<CR>", { silent = true }) -- "Find usage"
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

keymap("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "<leader>gv", ":vsp<cr> <cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "<leader>gx", ":sp<cr> <cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "<leader>gt", ":tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>dd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
