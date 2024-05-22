return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = function(_, opts)
            local colors = require("dracula").colors()
            colors.comment = "#778bc7"
            local active_bg = "#1c1c1c" -- color234
            local inactive_bg = "#303030" -- color236
            local selection_bg = "#262626"

            return {
                overrides = {
                    Normal = { fg = colors.fg, bg = "None" },
                    NormalNC = { fg = colors.fg, bg = inactive_bg },
                    CursorLine = { bg = selection_bg },

                    TelescopeNormal = { fg = colors.fg, bg = active_bg },
                    TelescopeBorder = { fg = colors.fg, bg = active_bg },
                    TelescopePromptBorder = { fg = colors.fg, bg = active_bg },
                    TelescopeResultsBorder = { fg = colors.fg, bg = active_bg },
                    TelescopePreviewBorder = { fg = colors.fg, bg = active_bg },
                    TelescopeSelection = { fg = colors.fg, bg = selection_bg },

                    -- Make the Flash label easier to see
                    FlashLabel = { fg = "Yellow", bg = "Black" },
                },
            }
        end,
        init = function()
            vim.cmd([[colorscheme dracula]])
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = function(_, opts)
            local colors = require("catppuccin.palettes").get_palette("mocha")
            local active_bg = "#1c1c1c" -- color234
            local inactive_bg = "#303030" -- color236
            local selection_bg = "#262626"

            return {
                custom_highlights = {
                    Normal = { fg = colors.text, bg = "None" },
                    NormalNC = { fg = colors.text, bg = inactive_bg },
                    CursorLine = { bg = selection_bg },

                    TelescopeNormal = { fg = colors.text, bg = active_bg },
                    TelescopeBorder = { fg = colors.text, bg = active_bg },
                    TelescopePromptBorder = { fg = colors.text, bg = active_bg },
                    TelescopeResultsBorder = { fg = colors.text, bg = active_bg },
                    TelescopePreviewBorder = { fg = colors.text, bg = active_bg },
                    TelescopeSelection = { fg = colors.text, bg = selection_bg },
                },
            }
        end,
    },
}
