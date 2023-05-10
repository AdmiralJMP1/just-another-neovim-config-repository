vim.g.mapleader = " "

-- General
vim.keymap.set("i", "jk", "<ESC>", {desc = "= <ESC>"})
vim.keymap.set("n", "Q", ":q<CR>", {desc = "Quit"})

-- Movements
vim.keymap.set("n", "{", "{zz") vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "D", "<C-d>zz", {desc = "Down half screen"})
vim.keymap.set("n", "U", "<C-u>zz", {desc = "Up half screen"})

-- Search 
vim.keymap.set("n", "<leader>/", ":noh<cr>", {desc = "Clear search"})
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")

-- Buffers switch
vim.keymap.set("n", "<Leader>j", ":bp<CR>", {desc = "Previous buffer"})
vim.keymap.set("n", "<Leader>k", ":bn<CR>", {desc = "Next buffer"})

-- Copy / Paste stuff
vim.keymap.set("n", "R", "\"_d", {desc = "Remove without yank"})
vim.keymap.set("n", "x", "\"_dl", {noremap = true, desc = "Remove symbol without yank (right)"})
vim.keymap.set("n", "X", "\"_dh", {noremap = true, desc = "Remove symbol without yank (left)"})
vim.keymap.set("n", "<Leader>y", "\"*y", {desc = "Yank to system clipboard"})
vim.keymap.set("x", "<Leader>p", "\"_dP", {desc = "Past without yank"})
-- Hell-Spawned function to copy column of words
local function yank_separate_lines(motion)
    vim.fn.setreg('"', "");
    local linesCount = (vim.v.count or 1);

    for i=0,linesCount do
        vim.fn.setreg('"', vim.fn.getreg('"') .. vim.fn.expand("<cword>") .. "\n");
        print(motion);
        vim.cmd('normal! j');
        i = i + 1;
    end
end

vim.keymap.set(
    "n",
    "<leader>yl",
    yank_separate_lines,
    {
        desc = "Yank words at the bottom",
    }
)

-- Line inserts
vim.keymap.set("n", "<Leader>o", "o<Esc>==", {desc = "Insert line in normal mode"})
vim.keymap.set("n", "<Leader>O", "O<Esc>==", {desc = "Insert line in normal mode"})

-- File explorer
vim.keymap.set("n", "<Leader>fs", ":NvimTreeFindFile<CR>", {desc = "Move the cursor in the tree for the current buffer, opening folders if needed."})
vim.keymap.set("n", "<Leader>fm", ":NvimTreeToggle<CR>", {desc = "Open or close the tree"})

-- Undo
vim.keymap.set("n", "<leader>mc", ":UndotreeShow<CR>:UndotreeFocus<CR>", {desc = "Local Changes"})

-- Language
vim.keymap.set("n", "<leader>ls", "z=", {desc = "Spell check"})

-- Tabs
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", {desc = "Close tab"})

-- Editing mode
vim.keymap.set("i", "<C-F>", "<C-o>\"_de", {desc = "Delete word forward"})

