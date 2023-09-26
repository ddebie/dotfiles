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
        config = function()
            require("leap").add_default_mappings()
        end,
    },
}
