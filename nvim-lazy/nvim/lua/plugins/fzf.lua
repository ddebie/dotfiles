return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        { "junegunn/fzf", build = "./install --bin" },
    },
    opts = {
        "telescope",
    },
    keys = {
        { "<C-p>", "<cmd> FzfLua files <CR>", desc = "Find files" },
        { "<leader>p", "<cmd> FzfLua resume <CR>", desc = "Fzf resume" },
        { "<C-f>", "<cmd> FzfLua grep_project <CR>", desc = "Live grep" },
    },
}
