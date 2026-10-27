local opt = vim.opt

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\\\"

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set
opt.clipboard = "unnamedplus"
opt.virtualedit = "block"
opt.inccommand = "split"
-- LazyVim auto format
vim.g.autoformat = true
-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.softtabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.guicursor = ""
opt.scrolloff = 8

-- backspace
opt.backspace = { "indent", "eol", "start" } -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
opt.backup = false
opt.undofile = true -- makes undos persistent even if file was closed

-- search settings
opt.incsearch = true
opt.ignorecase = true --  if all char are small it will search with ignorecase
opt.smartcase = true -- one capital letter and the search will be case sensitive

--opt.isfname:append("@-@“)
opt.updatetime = 50
-- opt.colorcolumn = "72" -- show visual column as line length guidance
opt.colorcolumn = "" -- show visual column as line length guidance

opt.mouse = "a"

vim.g.editorconfig = true

opt.hlsearch = true
-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker that is installed
vim.g.lazyvim_picker = "auto"

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Disable snippet support globally
vim.g.snippets = false

-- Disable LSP snippet support
vim.lsp.protocol.CompletionItemKind = vim.tbl_filter(function(kind)
  return kind ~= vim.lsp.protocol.CompletionItemKind.Snippet
end, vim.lsp.protocol.CompletionItemKind)
