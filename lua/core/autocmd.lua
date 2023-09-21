-- Auto resize splits when the size of Vim is changed
local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })
vim.api.nvim_create_autocmd(
    'VimResized',
    {
        group = wr_group,
        pattern = '*',
        command = 'wincmd =',
        desc = 'Automatically resize windows when the host window size changes.'
    }
)
