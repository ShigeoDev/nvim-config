return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "jdtls", "html", "cssls", "tsserver", "emmet_language_server",},
                auto_install = true
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
            local servers = { 'pyright', 'lua_ls', 'jdtls', 'html', 'cssls', 'tsserver', 'emmet_language_server', 'tailwindcss', 'mdx_analyzer' }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    -- on_attach = my_custom_on_attach,
                    capabilities = capabilities,
                }
            end

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, {})
        end
    }
}
