-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set

local map = vim.keymap.set

-- LSP keybindings (works for Go and other languages)
map("n", "<leader>Ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<leader>LD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "<leader>Lh", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>Li", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "<leader>Lr", vim.lsp.buf.references, { desc = "Show References" })
map("n", "<leader>Lt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
map("n", "<leader>Ln", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>La", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>Lf", vim.lsp.buf.format, { desc = "Format Document" })
map("n", "<leader>Ls", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Better movement in insert mode
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines
map("n", "ü", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("n", "ä", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })

-- paste without replacing clipboard content
map("x", "<leader>p", [["_dP]])
map("v", "p", '"_dP')
map({ "n", "v" }, "<leader>d", [["_d]])

-- disable Q mode
map("n", "Q", "<nop>")

map(
  "n",
  "<leader>sr",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "replace word cursor is on globally" }
)

-- tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "previous tab" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
