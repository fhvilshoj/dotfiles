return {
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = false,
        init = function()
            vim.g.skip_ts_context_commentstring_module = true
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("config.treesitter")
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
    },
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown", -- or 'event = "VeryLazy"'
        opts = {
            -- configuration here or empty for defaults
        },
    },
    {
        "windwp/nvim-spectre",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>R", ":lua require('spectre').open()<CR>", desc = "Rename" },
        },
        opts = {
            mapping = {
                ["send_to_qf"] = {
                    map = "<C-q>",
                    cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                },
            },
        },
    },
    {
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = true,
    },
    {
        "danymat/neogen",
        config = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>cs", ":lua require('neogen').generate()<CR>",                  desc = "Generate Stub" },
            { "<leader>cf", ":lua require('neogen').generate({ type = 'func' })<CR>", desc = "Generate function stub" },
        },
        opt = {
            enabled = false,
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings",
                    },
                },
            },
        },
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "BufRead",
        opts = { automatic_installation = true },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        lazy = false,
        config = function()
            -- [[ Auto Completion ]]
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_conf = require("lspconfig")
            local settings = { capabilities = capabilities }
            lsp_conf.pyright.setup(settings)
            lsp_conf.lua_ls.setup(settings)
            lsp_conf.ts_ls.setup(settings)
            lsp_conf.tailwindcss.setup(settings)
            lsp_conf.prismals.setup(settings)

            local on_attach = function(client, bufnr)
                if client.name == "ruff_lsp" then
                    -- Disable hover in favor of Pyright
                    -- client.server_capabilities.hoverProvider = false
                end
            end

            require("lspconfig").ruff_lsp.setup({
                on_attach = on_attach,
            })
        end,
    },
    {
        "glepnir/lspsaga.nvim", -- a maintained fork of glepnir/lspsaga.nvim
        event = "BufRead",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            -- Code
            {
                "<leader>cH",
                "<cmd>Lspsaga incoming_calls<CR>",
                silent = true,
                desc = "Find incoming calls",
            },
            {
                "<leader>cu",
                "<cmd>Lspsaga finder<CR>",
                silent = true,
                desc = "Find usage",
            },
            {
                "<leader>ca",
                "<cmd>Lspsaga code_action<CR>",
                mode = { "n", "v" },
                silent = true,
                desc = "Code actions",
            },
            {
                "<leader>cr",
                "<cmd>Lspsaga rename<CR>",
                silent = true,
                desc = "Rename",
            },
            {
                "<leader>co",
                "<cmd>Lspsaga outline<CR>",
                silent = true,
                desc = "Show outline",
            },
            {
                "<leader>ct",
                "<cmd>Lspsaga peek_type_definition<CR>",
                silent = true,
                desc = "Peak type definition",
            },
            {
                "<leader>cp",
                "<cmd>Lspsaga peek_definition<CR>",
                silent = true,
                desc = "Peak definition",
            },
            {
                "<leader>cl",
                "<cmd>Lspsaga show_line_diagnostics<CR>",
                silent = true,
                desc = "Line diagnostics",
            },
            {
                "<leader>cc",
                "<cmd>Lspsaga show_cursor_diagnostics<CR>",
                silent = true,
                desc = "Cursor diagnostics",
            },
            {
                "<leader>ch",
                "<cmd>Lspsaga hover_doc<CR>",
                silent = true,
                desc = "Hover docs",
            },
            -- Go to
            { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>",               desc = "Go to definition" },
            { "<leader>gv", ":vsp<cr> <cmd>lua vim.lsp.buf.definition()<CR>",      desc = "(v) Go to definition" },
            { "<leader>gx", ":sp<cr> <cmd>lua vim.lsp.buf.definition()<CR>",       desc = "(h) Go to definition" },
            { "<leader>gt", ":tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>", desc = "(t) Go to definition" },
            -- Next/prev.
            {
                "[e",
                "<cmd>Lspsaga diagnostic_jump_prev<CR>",
                silent = true,
                desc = "Next diagnostic",
            },
            {
                "]e",
                "<cmd>Lspsaga diagnostic_jump_next<CR>",
                silent = true,
                desc = "Pref. diagnostic",
            },
            {
                "[E",
                function()
                    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
                end,
                silent = true,
                desc = "Next error",
            },
            {
                "]E",
                function()
                    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
                end,
                silent = true,
                desc = "Prev. error",
            },
        },
    },
    { "pantharshit00/vim-prisma" },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
        keys = {
            {
                "<leader>re",
                function()
                    require("refactoring").refactor("Extract Function")
                end,
                mode = "x",
            },
            {
                "<leader>rf",
                function()
                    require("refactoring").refactor("Extract Function To File")
                end,
                mode = "x",
            },
            -- Extract function supports only visual mode
            {
                "<leader>rv",
                function()
                    require("refactoring").refactor("Extract Variable")
                end,
                mode = "x",
            },
            -- Extract variable supports only visual mode
            {
                "<leader>rI",
                function()
                    require("refactoring").refactor("Inline Function")
                end,
                mode = "n",
            },
            -- Inline func supports only normal
            {
                "<leader>ri",
                function()
                    require("refactoring").refactor("Inline Variable")
                end,
                mode = { "n", "x" },
            },

            -- Inline var supports both normal and visual mode
            {
                "<leader>rb",
                function()
                    require("refactoring").refactor("Extract Block")
                end,
                mode = "n",
            },
            {
                "<leader>rbf",
                function()
                    require("refactoring").refactor("Extract Block To File")
                end,
                mode = "n",
            },
            -- Extract block supports only normal mode
        },
    },
}
