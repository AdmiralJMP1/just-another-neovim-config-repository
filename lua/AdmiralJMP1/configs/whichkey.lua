vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
}

local wk = require("which-key")
wk.register({
	["<leader>f"] = {
		name = "Find / Files",
	},
	["<leader>m"] = {
		name = "Menu",
	},
    ["<leader>l"] = {
        name = "Language",
    },
    ["<leader>g"] = {
        name = "Git",
    },
    ["<leader>t"] = {
        name = "Tabs",
    },
})
