return {
    -- Enhanced completion without snippets
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-emoji",
        },
        opts = function(_, opts)
            local cmp = require("cmp")

            -- Remove snippet functionality completely
            opts.snippet = nil

            opts.mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })

            -- Remove luasnip from sources
            opts.sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },
                { name = "buffer",   priority = 500 },
                { name = "path",     priority = 250 },
                { name = "nvim_lua", priority = 100 },
                { name = "emoji",    priority = 100 },
            })

            opts.formatting = {
                format = function(entry, vim_item)
                    -- Kind icons (removed Snippet icon)
                    local kind_icons = {
                        Text = "",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰇽",
                        Variable = "󰂡",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰅲",
                    }
                    vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                    -- Source (removed luasnip)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                        nvim_lua = "[Lua]",
                        emoji = "[Emoji]",
                    })[entry.source.name]
                    return vim_item
                end
            }

            opts.window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }

            -- Disable ghost text completely
            opts.experimental = {
                ghost_text = false,
            }

            return opts
        end,
    },
}
