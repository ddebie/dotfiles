-- Auto resize splits when the size of Vim is changed
local wr_group = vim.api.nvim_create_augroup("WinResize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
    group = wr_group,
    pattern = "*",
    command = "wincmd =",
    desc = "Automatically resize windows when the host window size changes.",
})

-- Auto reload file when changed on disk (like git checkout for example)
-- https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482/3
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
