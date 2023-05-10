-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- File Explorer setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 15
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'

-- save automatically when text is changed
vim.opt.updatetime = 50

-- split horizontal window to the right of the current window
vim.opt.splitright = true
-- split vertical window to the bottom of the current window
vim.opt.splitbelow = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- swap
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/nvim-cache/undo"
vim.opt.undofile = true

-- Lang
vim.opt.spelloptions = "camel"

