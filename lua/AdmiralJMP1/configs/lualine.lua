require('lualine').setup {
    options = {
        theme = 'onedark',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'buffers'},
        lualine_c = {'branch', 'diff', 'diagnostics'},
        lualine_x = {'searchcount'},
        lualine_y = {
            'g:metals_status',
            {
                'filename',
                path = 1,
            },
        },
        lualine_z = {'progress'},
    },
}
