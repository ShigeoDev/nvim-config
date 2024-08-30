return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "lukas-reineke/cmp-under-comparator"
        }
    },
    {
        "hrsh7th/nvim-cmp",

        config = function()
            local cmp = require 'cmp'
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        --vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    preselect = cmp.PreselectMode.None,
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i" }),
                }),
                sources = cmp.config.sources({
                    {
                        name = 'nvim_lsp',
                        max_item_count = 25,
                        priority = 6,
                    },
                    {
                        name = 'path',
                        priority = 10,
                    },
                    {
                        name = 'nvim_lsp_signature_help',
                    },
                    {
                        name = 'luasnip',
                        max_item_count = 3,
                        priority = 3,
                    }, -- For luasnip users.
                    {
                        name = 'buffer',
                        priority = 10,
                    },
                }),
                sorting = {
                    priority_weight = 1.0,
                    comparators = {
                        -- compare.score_offset, -- not good at all
                        cmp.config.compare.locality,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.exact,
                        cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                        cmp.config.compare.offset,
                        cmp.config.compare.order,
                        require "cmp-under-comparator".under,
                        -- compare.scopes,
                        --  cmp.config.compare.sort_text,
                        -- compare.kind,
                        -- compare.length, -- useless 
                    },
                }

            })
        end,
    },
}
