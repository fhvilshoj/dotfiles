return {
    {
        "glacambre/firenvim",
        cond = not not vim.g.started_by_firenvim,
        build = function()
            require("lazy").load({ plugins = "firenvim", wait = true })
            vim.fn["firenvim#install"](0)
        end,

        -- configure FireNvim here:
        config = function()
            vim.g.firenvim_config = {
                localSettings = {
                    [".*"] = {
                        takeover = "never",
                    },
                },
            }
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                group = "firenvim",
                pattern = "colab.research.google.com_*.txt",
                command = "set filetype=python",
            })
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                group = "firenvim",
                pattern = "github.com_*.txt",
                command = "set filetype=markdown",
            })
        end,
    },
}
