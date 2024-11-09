map = vim.keymap

-- jk/kj to exit insert mode
map.set("i", "jk", "<Esc>")
map.set("i", "kj", "<Esc>")

-- Ctrl + hjkl to move around splits
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-l>", "<C-w>l")

-- <leader> + tl to toggle line numbers
map.set("n", "<leader>tl", function()
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle line numbers" })

-- <leader> + td to toggle virtual text/diagnostics
vim.keymap.set("n", "<leader>td", function()
    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end, { silent = true, noremap = true, desc = "Toggle diagnostics (virtual text)" })

-- Tab or Shift+Tab to change indent
map.set("v", "<Tab>", ">gv")
map.set("v", "<S-Tab>", "<gv")
