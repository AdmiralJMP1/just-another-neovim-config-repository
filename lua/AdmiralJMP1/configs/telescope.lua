local builtin = require('telescope.builtin')
local telescope = require('telescope')

require('telescope').setup{
	defaults = {
        file_ignore_patterns = {"node_modules"},
        layout_strategy = "vertical",
        layout_config = {
            height = 0.95,
            width = 0.9,
            mirror = true,
            prompt_position = "top",
        },
    },
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}

require('telescope').load_extension('fzf')

-- Regular commands
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find Files by Name'})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "Find Buffers"})
vim.keymap.set(
    'n',
    '<leader>fg',
    function()
        builtin.grep_string({search = vim.fn.input("Text > ")})
    end,
    {desc = "Find by text"}
)

-- LSP search
vim.keymap.set("n", "<leader>fu", function() builtin.lsp_references({fname_width = 80}) end, {desc = "LSP References (Find Usaged)"})
vim.keymap.set("n", "<leader>f<leader>d", function() builtin.lsp_definitions({fname_width = 80}) end, {desc = "LSP Definitions"})
vim.keymap.set("n", "<leader>fd", function() builtin.lsp_document_symbols({fname_width = 80}) end, {desc = "LSP Document Search"})

-- There are also properties and methods by I can't find them useful
vim.keymap.set("n", "<leader>fw", ":Telescope lsp_dynamic_workspace_symbols fname_width=80 symbols=class,constant,variable<CR>", {desc = "LSP Workspace Search"})
vim.keymap.set("n", "<leader>fc", ":Telescope lsp_dynamic_workspace_symbols fname_width=80 symbols=class<CR>",  {desc = "LSP Class Search"})

-- Metals menu
vim.keymap.set("n", "<leader>fM", telescope.extensions.metals.commands, {desc = "Metals"})

-- Git commands
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {desc = "Git Branches"})

