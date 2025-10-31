return {
	{
		"renerocksai/calendar-vim",
	},
	{
		"mpas/marp-nvim",
		lazy = true,
		init = function()
			require("marp")
		end,
		keys = {
			{ "<leader>mt", ":MarpToggle<CR>", desc = "Marp (slides) toggle" },
			{ "<leader>ms", ":MarpStatus<CR>", desc = "Marp status" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		ft = { "markdown" },
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		keys = {
			{ "<leader>mp", ":MarkdownPreview<CR>", desc = "Markdown preview" },
		},
	},
	{
		"renerocksai/telekasten.nvim",
		module = "telekasten",
		keys = function()
			if not pcall(require, "telescope") then
				return {}
			end

			local tk = require("telekasten")
			return {
				{ "<leader>zf", tk.find_notes, desc = "[Z] Find notes" },
				{ "<leader>zd", tk.find_daily_notes, desc = "[Z] Find daily notes" },
				{ "<leader>zg", tk.search_notes, desc = "[Z] Find in notes" },
				{ "<leader>zz", tk.follow_link, desc = "[Z] Follow link" },
				{ "<leader>zT", tk.goto_today, desc = "[Z] Goto Today" },
				{ "<leader>zW", tk.goto_thisweek, desc = "[Z] Goto Week" },
				{ "<leader>zw", tk.find_weekly_notes, desc = "[Z] Find weekly note" },
				{ "<leader>zn", tk.new_note, desc = "[Z] New note " },
				{ "<leader>zN", tk.new_templated_note, desc = "[Z] New templated note " },
				{ "<leader>zy", tk.yank_notelink, desc = "[Z] Yank note link" },
				{ "<leader>zc", tk.show_calendar, desc = "[Z] Show calendar" },
				{ "<leader>zC", ":CalendarT<CR>" },
				{ "<leader>zi", tk.paste_img_and_link, desc = "[Z] Paste image and link" },
				{ "<leader>zt", tk.toggle_todo, desc = "[Z] Toggle TODO" },
				{ "<leader>zb", tk.show_backlinks, desc = "[Z] Backward links" },
				{ "<leader>zF", tk.find_friends, desc = "[Z] Find friends" },
				{ "<leader>zm", tk.browse_media, desc = "[Z] Find media " },
				{ "<leader>za", tk.show_tags, desc = "[Z] Show tags" },
				{ "<leader>zr", tk.rename_note, desc = "[Z] Rename note " },
				{ "<leader>z", tk.panel, desc = "[Z] Panel" },
			}
		end,
		opts = function()
			local home = vim.fn.expand("~/Documents/Notes/zettelkasten")
			return {
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
			}
		end,
	},
}
