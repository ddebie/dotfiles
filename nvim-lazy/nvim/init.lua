-- First run files in "core", do things like vim opts for example
require("core")
require("core.keymaps")
require("core.autocmd")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    -- Suppress the annoying notification that comes up whenever you change dotfiles
    change_detection = { notify = false },
})
