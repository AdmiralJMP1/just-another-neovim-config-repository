require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = {
        "help",
        "javascript",
        "typescript",
        "scala",
        "c",
        "lua",
        "vim",
        "help",
        "java",
        "tsx",
    },

	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    indent = {
        enable = true,
    },
})
