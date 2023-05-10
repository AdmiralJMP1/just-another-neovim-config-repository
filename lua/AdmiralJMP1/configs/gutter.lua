-- Define the sign column to use for gitgutter signs
vim.g.gitgutter_sign_added = '▍'
vim.g.gitgutter_sign_modified = '▍'
vim.g.gitgutter_sign_removed = '▍'
-- Currently idk what is it
vim.g.gitgutter_sign_removed_first_line = '▍^'
vim.g.gitgutter_sign_removed_above_and_below = '▍{'
vim.g.gitgutter_sign_modified_removed = '▍w'
vim.g.gitgutter_map_keys = 0

-- Define the highlight groups to use for gitgutter signs
vim.api.nvim_exec([[
  highlight GitGutterAdd guifg=#98c278 ctermfg=2
  highlight GitGutterChange guifg=#60afef ctermfg=3
  highlight GitGutterDelete guifg=#e76671 ctermfg=1
]], false)

vim.keymap.set("n", '<Leader>gn', ":GitGutterNextHunk<CR>", {desc = "Next Hunk"});
vim.keymap.set("n", '<Leader>gN', ":GitGutterPrevHunk<CR>", {desc = "Prev Hunk"});
vim.keymap.set("n", "<Leader>gp", ":GitGutterPreviewHunk<CR>", {desc = "Preview Hunk"});
vim.keymap.set("n", "<leader>gu", ":GitGutterUndoHunk<CR>", {desc = "Undo Hunk"});

