return {
	{ "tpope/vim-surround", lazy = false },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufRead",
		config = function()
			require("config.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
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
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>cs", ":lua require('neogen').generate()<CR>", desc = "Generate Stub" },
		},
		config = true,
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
			"hrsh7th/cmp-nvim-lsp",
		},
		lazy = false,
		config = function()
			-- [[ Auto Completion ]]
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lua_conf = require("config.lua_lsp_config")
			lua_conf.capabilities = capabilities

			local settings = { capabilities = capabilities }

			vim.lsp.enable("pyright", settings)
			vim.lsp.enable("lua_ls", lua_conf)
			vim.lsp.enable("ts_ls", lua_conf)

			-- lsp_conf.tailwindcss.setup(settings)
			-- lsp_conf.prismals.setup(settings)
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
			{ "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
			{ "<leader>gv", ":vsp<cr> <cmd>lua vim.lsp.buf.definition()<CR>", desc = "(v) Go to definition" },
			{ "<leader>gx", ":sp<cr> <cmd>lua vim.lsp.buf.definition()<CR>", desc = "(h) Go to definition" },
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
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
	{
		"lervag/vimtex",
		lazy = false,
		-- tag = "v2.15", -- uncomment to pin to a specific release
		config = function()
			--global vimtex settings
			vim.g.vimtex_imaps_enabled = 0 --i.e., disable them
			--vimtex_view_settings
			vim.g.vimtex_view_method = "skim" -- change this, depending on what you want to use..sumatraPDF, or skim, or zathura, or...
			-- vim.g.vimtex_view_method = "general" -- change this, depending on what you want to use..sumatraPDF, or skim, or zathura, or...
			vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
			--quickfix settings
			vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
			vim.g.vimtex_quickfix_ignore_filters = {
				"Underfull",
				"Overfull",
				"LaTeX Warning: .\\+ float specifier changed to",
				"Package hyperref Warning: Token not allowed in a PDF string",
			}
		end,
	},
}
