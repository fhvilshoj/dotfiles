return require("packer").startup(function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })

    -- [[ Plugins ]]
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = [[require("config.treesitter")]],
    })

    -- [[ Fun stuff ]]
    use("nvim-treesitter/playground")
    use("ThePrimeagen/vim-be-good")

    -- [[ navigation ]]
    use("christoomey/vim-tmux-navigator")

    -- [[ Code Utils ]]
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })

    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({
        "neovim/nvim-lspconfig",
        requires = { "jose-elias-alvarez/null-ls.nvim" },
        config = function()
            require("config.lsp")
        end,
    })
    use({ -- Comment out code
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({
        "danymat/neogen",
        config = function()
            require("neogen").setup({})
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        setup = function()
            local nnoremap = require("utils.mappers").nnoremap
            nnoremap({ "<leader>gs", ":lua require('neogen').generate()<CR>" })
        end,
    })

    -- Find and replace
    use({
        "windwp/nvim-spectre",
        opt = true,
        module = "spectre",
        wants = { "plenary.nvim", "popup.nvim" },
        requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        setup = function()
            local nnoremap = require("utils.mappers").nnoremap
            nnoremap({ "<leader>R", ":lua require('spectre').open()<CR>" })
        end,
        config = function()
            require("spectre").setup({
                mapping = {
                    ["send_to_qf"] = {
                        map = "<C-q>",
                        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                    },
                },
            })
        end,
    })

    -- [[ File manager ]]
    --
    use({
        "luukvbaal/nnn.nvim",
        config = function()
            local builtin = require("nnn").builtin
            mappings = {
                { "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
                { "<C-s>", builtin.open_in_split }, -- open file(s) in split
                { "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
                { "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
                -- { "l", builtin.open },   -- open file in preview split keeping nnn focused
                { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
                { "<C-w>", builtin.cd_to_path }, -- cd to file directory
                { "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
            }
            require("nnn").setup({ picker = { cmd = "nnn -dH" }, mappings = mappings })
            require("utils.mappers").nnoremap({ "<leader>n", ":NnnPicker %<CR>" })
        end,
    })

    -- [[ Search ]]
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "kdheepak/lazygit.nvim" },
            { "ThePrimeagen/harpoon" },
            { "nvim-lua/popup.nvim" },
            { "nvim-telescope/telescope-symbols.nvim" },
            -- { "nvim-telescope/telescope-media-files.nvim" },
        },
        config = function()
            require("config.telescope")
            require("config.telescope.mappings")
        end,
    })
    use({
        "ThePrimeagen/harpoon",
        requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        setup = function()
            local nnoremap = require("utils.mappers").nnoremap
            nnoremap({ "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>" })
            nnoremap({ "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>" })
            nnoremap({ "<leader>hm", ":lua require('harpoon.ui').nav_file(1)<CR>" })
            nnoremap({ "<leader>h,", ":lua require('harpoon.ui').nav_file(2)<CR>" })
            nnoremap({ "<leader>h.", ":lua require('harpoon.ui').nav_file(3)<CR>" })
            nnoremap({ "<leader>hj", ":lua require('harpoon.ui').nav_file(4)<CR>" })
            nnoremap({ "<leader>hk", ":lua require('harpoon.ui').nav_file(5)<CR>" })
            nnoremap({ "<leader>hl", ":lua require('harpoon.ui').nav_file(6)<CR>" })
            nnoremap({ "<leader>hu", ":lua require('harpoon.ui').nav_file(7)<CR>" })
            nnoremap({ "<leader>hi", ":lua require('harpoon.ui').nav_file(8)<CR>" })
            nnoremap({ "<leader>ho", ":lua require('harpoon.ui').nav_file(9)<CR>" })
        end,
        config = function()
            require("harpoon").setup({
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 10,
                },
            })
        end,
    })

    -- [[ Theme ]]
    use({ "mhinz/vim-startify" }) -- start screen
    use({
        "nvim-lualine/lualine.nvim", -- statusline
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
    })
    use({ "Mofiqul/dracula.nvim" })
    use("folke/lsp-colors.nvim")

    -- [[ Copy code ]]
    -- use({
    --     "krivahtoo/silicon.nvim",
    --     run = "./install.sh",
    --     config = function()
    --         require("silicon").setup({
    --             -- The following key is required if you want to save image to file instead of clipboard
    --             output = "/tmp/silicon",
    --             -- The following keys are all optional
    --             -- with default values
    --             font = "Hack Nerd Font Mono=20",
    --             theme = "Monokai Extended",
    --             background = "#fff0",
    --             shadow = {
    --                 blur_radius = 0.0,
    --                 offset_x = 0,
    --                 offset_y = 0,
    --                 color = "#0000",
    --             },
    --             pad_horiz = 80,
    --             pad_vert = 80,
    --             line_number = false,
    --             line_pad = 2,
    --             line_offset = 1,
    --             tab_width = 4,
    --             round_corner = true,
    --             window_controls = true,
    --         })
    --     end,
    -- })

    -- [[ Code Completion ]]
    use({
        "dcampos/nvim-snippy",
        config = function()
            require("snippy").setup({
                mappings = {
                    is = {
                        ["<Tab>"] = "expand_or_advance",
                        ["<S-Tab>"] = "previous",
                    },
                    nx = {
                        ["<leader>x"] = "cut_text",
                    },
                },
            })
        end,
    })
    use("dcampos/cmp-snippy")
    use("honza/vim-snippets")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-emoji")
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp").setup()
        end,
    })
    use("f3fora/cmp-spell")

    use({
        "glepnir/lspsaga.nvim", -- a maintained fork of glepnir/lspsaga.nvim
        branch = "main",
        -- cmd = {"Lspsaga"},
        config = function()
            require("lspsaga").init_lsp_saga({
                code_action_lightbulb = {
                    enable = true,
                    sign = true,
                    enable_in_insert = false,
                    sign_priority = 20,
                    virtual_text = false,
                },
            })
        end,
    })

    -- [[ State ]]
    use({
        "Shatur/neovim-session-manager",
        config = function()
            require("session_manager").setup({
                autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
                autosave_only_in_session = true,
            })
        end,
        require = { "nvim-lua/plenary.nvim" },
    })

    -- [[ Browser ]]
    use({
        "glacambre/firenvim",
        run = function()
            vim.fn["firenvim#install"](0)
        end,
        config = [[require("config.firenvim")]],
    })

    -- [[ Git ]]
    use({
        "kdheepak/lazygit.nvim",
        config = function()
            vim.keymap.set("n", "<leader>gg", [[:LazyGit<CR>]], {})
        end,
    })

    use("tpope/vim-fugitive")

    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map("n", "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    map("n", "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    -- Actions
                    map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
                    map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
                    map("n", "<leader>hS", gs.stage_buffer)
                    map("n", "<leader>hu", gs.undo_stage_hunk)
                    map("n", "<leader>hR", gs.reset_buffer)
                    map("n", "<leader>hp", gs.preview_hunk)
                    map("n", "<leader>hb", function()
                        gs.blame_line({ full = true })
                    end)
                    map("n", "<leader>tb", gs.toggle_current_line_blame)
                    map("n", "<leader>hd", gs.diffthis)
                    map("n", "<leader>hD", function()
                        gs.diffthis("~")
                    end)
                    map("n", "<leader>td", gs.toggle_deleted)

                    -- Text object
                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
                end,
            })
        end,
    })

    -- [[ Notes ]]
    use("renerocksai/calendar-vim")
    use({ disable = true, "preservim/vim-markdown" })

    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = { "markdown", "vim-plug" },
        setup = function()
            local nnoremap = require("utils.mappers").nnoremap
            nnoremap({ "<leader>mp", ":MarkdownPreview<CR>" })
        end,
    })

    use({ "mzlogin/vim-markdown-toc" })
    use({
        "renerocksai/telekasten.nvim",
        module = "telekasten",
        setup = function()
            local nnoremap = require("utils.mappers").nnoremap

            nnoremap({
                "<leader>zf",
                function()
                    require("telekasten").find_notes()
                end,
            })
            nnoremap({
                "<leader>zd",
                function()
                    require("telekasten").find_daily_notes()
                end,
            })
            nnoremap({
                "<leader>zg",
                function()
                    require("telekasten").search_notes()
                end,
            })
            nnoremap({
                "<leader>zz",
                function()
                    require("telekasten").follow_link()
                end,
            })
            nnoremap({
                "<leader>zT",
                function()
                    require("telekasten").goto_today()
                end,
            })
            nnoremap({
                "<leader>zW",
                function()
                    require("telekasten").goto_thisweek()
                end,
            })
            nnoremap({
                "<leader>zw",
                function()
                    require("telekasten").find_weekly_notes()
                end,
            })
            nnoremap({
                "<leader>zn",
                function()
                    require("telekasten").new_note()
                end,
            })
            nnoremap({
                "<leader>zN",
                function()
                    require("telekasten").new_templated_note()
                end,
            })
            nnoremap({
                "<leader>zy",
                function()
                    require("telekasten").yank_notelink()
                end,
            })
            nnoremap({
                "<leader>zc",
                function()
                    require("telekasten").show_calendar()
                end,
            })
            nnoremap({ "<leader>zC", "CalendarT<CR>" })
            nnoremap({
                "<leader>zi",
                function()
                    require("telekasten").paste_img_and_link()
                end,
            })
            nnoremap({
                "<leader>zt",
                function()
                    require("telekasten").toggle_todo()
                end,
            })
            nnoremap({
                "<leader>zb",
                function()
                    require("telekasten").show_backlinks()
                end,
            })
            nnoremap({
                "<leader>zF",
                function()
                    require("telekasten").find_friends()
                end,
            })
            nnoremap({
                "<leader>zp",
                function()
                    require("telekasten").preview_img()
                end,
            })
            nnoremap({
                "<leader>zm",
                function()
                    require("telekasten").browse_media()
                end,
            })
            nnoremap({
                "<leader>za",
                function()
                    require("telekasten").show_tags()
                end,
            })
            nnoremap({
                "<leader>#",
                function()
                    require("telekasten").show_tags()
                end,
            })
            nnoremap({
                "<leader>zr",
                function()
                    require("telekasten").rename_note()
                end,
            })
            nnoremap({
                "<leader>z",
                function()
                    require("telekasten").panel()
                end,
            })
        end,
        config = function()
            local home = vim.fn.expand("~/Documents/Notes/zettelkasten")
            require("telekasten").setup({
                home = home,
                take_over_my_home = true,
                auto_set_filetype = true,
                dailies = home .. "/" .. "daily",
                weeklies = home .. "/" .. "weekly",
                templates = home .. "/" .. "templates",
                image_subdir = "img",
                extension = ".md",
                follow_creates_nonexisting = true,
                dailies_create_nonexisting = true,
                weeklies_create_nonexisting = true,
                template_new_note = home .. "/" .. "templates/new_note.md",
                template_new_daily = home .. "/" .. "templates/daily.md",
                template_new_weekly = home .. "/" .. "templates/weekly.md",
                new_note_filename = "uuid-title",
                image_link_style = "markdown",
                plug_into_calendar = true,
                calendar_opts = {
                    weeknm = 4,
                    calendar_monday = 1,
                    calendar_mark = "left-fit",
                },
                close_after_yanking = false,
                insert_after_inserting = true,
                tag_notation = "#tag",
                command_palette_theme = "dropdown",
                show_tags_theme = "dropdown",
                subdirs_in_links = true,
                template_handling = "smart",
                new_note_location = "smart",
                rename_update_links = true,
            })
        end,
    })
end)

-- require('neogen').setup({
-- snippet_engine = "snippy",
-- languages = {
-- lua = {
-- template = { annotation_convention = "emmylua" }
-- },
-- python = {
-- template = { annotation_convention = "reST" }
-- }
-- }
-- })

-- require("lsp-colors").setup({
-- Error = "#db4b4b",
-- Warning = "#e0af68",
-- Information = "#0db9d7",
-- Hint = "#10B981"
-- })

-- require('gitsigns').setup()
