vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Files
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = { {
            'nvim-lua/plenary.nvim',
        } },
		config = [[ require("AdmiralJMP1/configs/telescope") ]]
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = [[ require("AdmiralJMP1/configs/nvim-tree") ]]
    }

    -- Coding
    use {
        'numToStr/Comment.nvim',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = [[ require("AdmiralJMP1/configs/comments") ]]
    }

	-- Lang processing
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function() require("nvim-treesitter.install").update { with_sync = true } end,
        config = [[ require("AdmiralJMP1/configs/treesitter") ]]
	})

    use 'nvim-treesitter/nvim-treesitter-context'

    use({
        "github/copilot.vim",
    })

	-- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'L3MON4D3/LuaSnip'},     -- Required
        },
		config = [[ require("AdmiralJMP1/configs/lsp") ]]
    }

    use(
        {
            'scalameta/nvim-metals',
            requires = { "nvim-lua/plenary.nvim" }
        }
    )

    -- Git
    use {
        'tpope/vim-fugitive',
        config = [[ require("AdmiralJMP1/configs/fugitive") ]]
    }

    use {
        'airblade/vim-gitgutter',
        config = [[ require("AdmiralJMP1/configs/gutter") ]]
    }

    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[ require("AdmiralJMP1/configs/diffview") ]]
    }

    -- Different
    use {
        'mbbill/undotree',
    }

    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {}
        end,
    })

	-- UI and Helpers
	use {
		'navarasu/onedark.nvim',
		config = [[ require("AdmiralJMP1/configs/onedark") ]]
	}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = [[ require("AdmiralJMP1/configs/lualine") ]]
    }

    use {
        'chentoast/marks.nvim',
        config = function ()
            require("marks").setup({
                default_mappings = false,
                mappings = {
                    set = "m",
                    delete = "md",
                },
            });
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require("colorizer").setup{
                '*',
                css = {
                    RGB      = true;         -- #RGB hex codes
                    RRGGBB   = true;         -- #RRGGBB hex codes
                    names    = true;         -- "Name" codes like Blue
                    RRGGBBAA = true;        -- #RRGGBBAA hex codes
                    rgb_fn   = true;        -- CSS rgb() and rgba() functions
                    hsl_fn   = true;        -- CSS hsl() and hsla() functions
                    css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available modes: foreground, background
                    mode     = 'background'; -- Set the display mode.
                }
            }
        end
    }

	use {
		"folke/which-key.nvim",
		config = [[ require("AdmiralJMP1/configs/whichkey") ]]
	}

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

end)

