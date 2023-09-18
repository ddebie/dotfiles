return {
  -- the colorscheme should be available when starting Neovim
  {
    "Mofiqul/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
        overrides = {
            Normal = { bg = "None" },
            NormalNC = { bg = "#303030" },
            -- CursorLine = { bg = "White" },
            CursorLine = { bg = "#262626" },
        }
    },
    init = function()
      vim.cmd([[colorscheme dracula]])
    end,
  }
}
