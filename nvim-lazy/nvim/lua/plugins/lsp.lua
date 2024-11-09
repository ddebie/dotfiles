return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- So you can see the LSP function signature as you're typing the functions
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            { "ray-x/lsp_signature.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            -- Used to use lsp_zer.default_keymaps here, but the g* keys weren't working for some reason
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                local map = function(m, lhs, rhs, desc)
                    vim.keymap.set(m, lhs, rhs, { buffer = bufnr, desc = desc })
                end
                map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover documentation")
                map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition")
                map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration")
                map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation")
                map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition")
                map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "Go to reference")
                map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show function signature")
                map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol")
                map("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format file")
                map("x", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format selection")
                map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Execute code action")

                if vim.lsp.buf.range_code_action then
                    map("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Execute code action")
                else
                    map("x", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Execute code action")
                end

                map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostic")
                map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic")
                map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic")
            end)

            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "rust_analyzer" },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,

                    -- this is the "custom handler" for `lua_ls`
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })
        end,
    },
}
