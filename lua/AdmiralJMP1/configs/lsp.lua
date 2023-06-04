-- Default setup
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

-- Exclude metals (was in manual setup)
lsp.skip_server_setup({'metals'})

-- Languages list
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
})

-- Diagnostics
vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    virtual_text = {
        source = "always",
        prefix = '●',
        spacing = 4,
    },
    float = {
        source = "always",
    },
    signs = false,
})

-- Autocomplete
local cmp = require('cmp')

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function()
        vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
    end),
})

cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  expereimental = {
    ghost_text = false,
  },
  sources = {
      { name = 'copilot', group_index = 1},
      { name = 'path', group_index = 2},
      { name = 'nvim_lsp', group_index = 3},
      { name = 'buffer', group_index = 4},
  }
})

-- Function to change eslint severity on the fly
local eslint_forced_warnings = true;
local function change_eslint_severity()
    eslint_forced_warnings = not eslint_forced_warnings;
end

-- LSP keymap
lsp.on_attach(function(_, bufnr)
    local function make_opts(desc)
        return {buffer = bufnr, remap = false, desc = desc}
    end

    -- Go to diagnostic by severity
    local function goto_diagnostic(goto_func, get_func)
        local error = get_func({severity = vim.diagnostic.severity.ERROR});
        if (error) then
            goto_func({severity = vim.diagnostic.severity.ERROR})
            return
        end
        local warn = get_func({severity = vim.diagnostic.severity.WARN});
        if (warn) then
            goto_func({severity = vim.diagnostic.severity.WARN})
            return
        end
        goto_func();
    end

    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, make_opts("Go to Defenition"))
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, make_opts("Info"))
    vim.keymap.set("n", "<leader>d", function() goto_diagnostic(vim.diagnostic.goto_next, vim.diagnostic.get_next_pos) end, make_opts("Next diagnostic"))
    vim.keymap.set("n", "<leader>D", function() goto_diagnostic(vim.diagnostic.goto_prev, vim.diagnostic.get_prev_pos) end, make_opts("Prev diagnostic"))
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, make_opts("Code action"))
    vim.keymap.set("n", "<leader>lu", vim.lsp.buf.references, make_opts("References (Find usages)"))
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, make_opts("Rename (Refactor)"))
    vim.keymap.set("n", "<leader>lee", change_eslint_severity, make_opts("Toggle eslint severity (error/warning)"))
    -- TODO was a <C-h> mb by a reason
    vim.keymap.set("i", "<C-p>", vim.lsp.buf.signature_help, make_opts("Like signature_help (show info about function e.g.)"))
    vim.keymap.set("n", "<C-p>", vim.lsp.buf.signature_help, make_opts("Like signature_help (show info about function e.g.)"))
end)

lsp.configure('eslint', {
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            function(_, result, ctx, config)
                local diagnostics = result.diagnostics or {}
                for _, diagnostic in ipairs(diagnostics) do
                    if diagnostic.severity == vim.lsp.protocol.DiagnosticSeverity.Error and eslint_forced_warnings then
                        diagnostic.severity = vim.lsp.protocol.DiagnosticSeverity.Warning
                    end
                end

                vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
            end,
            -- Without underline (it's too laggish)
            {
                underline = false,
            }
        ),
    },
})

lsp.configure("tsserver", {
    settings = {
        typescript = {
            format = {
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
            },
        },
    },
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

-- Metals for scala
local metals_config = require('metals').bare_config()
metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- This is used to start metals ¯\_(ツ)_/¯ (was in manual setup)
local metals_augroup = vim.api.nvim_create_augroup('nvim-metals', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    group = metals_augroup,
    pattern = {'scala', 'sbt', 'java'},
    callback = function()
        require('metals').initialize_or_attach(metals_config)
    end
})

