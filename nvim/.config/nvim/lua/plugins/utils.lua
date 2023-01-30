return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup({})
            require("config.keys").register()
        end,
    },
}
