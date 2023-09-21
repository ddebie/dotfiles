-- jk to exit insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Ctrl + hjkl to move around splits
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- <leader> + l to toggle line numbers
function toggle_linenumbers()
    print(vim.opt.number)
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end
vim.keymap.set("n", "<leader>l", toggle_linenumbers)

-- Tab or Shift+Tab to change indent
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

