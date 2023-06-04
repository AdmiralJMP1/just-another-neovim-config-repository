local diffview = require("diffview")
diffview.setup({
    enhanced_diff_hl = true,
})

vim.keymap.set("n", "<leader>gcc", ":DiffviewOpen<CR>", {desc = "Current Changes"})
vim.keymap.set("n", "<leader>gcd", ":DiffviewOpen develop..", {desc = "Diff with develop.."})

vim.keymap.set("n", "<leader>ghh", ":DiffviewFileHistory<CR>", {desc = "Git History"})
vim.keymap.set("n", "<leader>ghd", ":DiffviewFileHistory --range=develop..", {desc = "Git History with develop.."})
vim.keymap.set("n", "<leader>ghf", ":DiffviewFileHistory %<CR>", {desc = "Git History for Current File"})

