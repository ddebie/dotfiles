return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "python", "bash", "toml", "yaml", "xml", "rust" },
            indent = { enable = true },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
        })
    end,
}
