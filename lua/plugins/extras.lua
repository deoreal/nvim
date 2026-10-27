return {
    -- Better diagnostics display
    {
        "folke/trouble.nvim",
        opts = {
            modes = {
                lsp = {
                    win = { position = "right" },
                },
            },
        },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
            { "<leader>cs", "<cmd>Trouble symbols toggle<cr>",                  desc = "Symbols (Trouble)" },
            { "<leader>cS", "<cmd>Trouble lsp toggle<cr>",                      desc = "LSP references/definitions/... (Trouble)" },
            { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List (Trouble)" },
            { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List (Trouble)" },
        },
    },
    { "rmehri01/onenord.nvim" },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 1000,
                ignore_whitespace = false,
            },
        },
    },

    -- Better code outline
    {
        "hedyhli/outline.nvim",
        keys = {
            { "<leader>co", "<cmd>Outline<CR>", desc = "Toggle Outline" },
        },
        opts = {
            outline_window = {
                position = "right",
                width = 25,
                relative_width = true,
            },
            outline_items = {
                highlight_hovered_item = true,
                show_symbol_details = true,
            },
            symbols = {
                filter = {
                    default = { "String", exclude = true },
                    go = { "Package", "Module", "Namespace", "Class", "Constructor", "Enum",
                        "Interface", "Function", "Method", "Property", "Field", "Variable",
                        "Constant", "Struct", "Event", "Operator", "TypeParameter" },
                },
            },
        },
    },

    -- JSON/YAML support for Go configs
    {
        "b0o/schemastore.nvim",
        lazy = true,
        version = false,
    },

    -- Better fold handling
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        opts = {
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        },
        config = function(_, opts)
            require("ufo").setup(opts)
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        end,
    },
}
