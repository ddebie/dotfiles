map = vim.keymap

-- jk/kj to exit insert mode
map.set("i", "jk", "<Esc>")
map.set("i", "kj", "<Esc>")

-- Ctrl + hjkl to move around splits
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-l>", "<C-w>l")

-- <leader> + l to toggle line numbers
function toggle_linenumbers()
    print(vim.opt.number)
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end
map.set("n", "<leader>l", toggle_linenumbers)

-- Tab or Shift+Tab to change indent
map.set("v", "<Tab>", ">gv")
map.set("v", "<S-Tab>", "<gv")
