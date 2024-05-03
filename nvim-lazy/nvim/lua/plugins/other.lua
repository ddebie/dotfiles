return {
    -- Smart comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    -- Leap
    {
        "ggandor/leap.nvim",
        lazy = false,
        keys = {
            { "s", "<Plug>(leap)", mode = {"n", "x", "o"}, desc="Leap"},
            { "S", "<Plug>(leap-from-window)", mode = {"n", "x", "o"}, desc="Leap from window"}
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
}
