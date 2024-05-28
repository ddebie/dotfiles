return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({})

            -- Below is to exit nvim-tree when it's the last buffer
            -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
            vim.api.nvim_create_autocmd("QuitPre", {
                callback = function()
                    local tree_wins = {}
                    local floating_wins = {}
                    local wins = vim.api.nvim_list_wins()
                    for _, w in ipairs(wins) do
                        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                        if bufname:match("NvimTree_") ~= nil then
                            table.insert(tree_wins, w)
                        end
                        if vim.api.nvim_win_get_config(w).relative ~= "" then
                            table.insert(floating_wins, w)
                        end
                    end
                    if 1 == #wins - #floating_wins - #tree_wins then
                        -- Should quit, so we close all invalid windows.
                        for _, w in ipairs(tree_wins) do
                            vim.api.nvim_win_close(w, true)
                        end
                    end
                end,
            })
        end,
        keys = {
            { "<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" },
        },
    },
    {
        "stevearc/oil.nvim",
        opts = {
            -- Disable oil.nvim h/l keys so that Ctrl+hjkl split moves wor
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
            },
            view_options = {
                show_hidden = true,
            },
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>e", "<cmd>Oil .<cr>", desc = "Toggle Oil " },
        },
    },
}
