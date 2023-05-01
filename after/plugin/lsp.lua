local lsp = require('lsp-zero')

lsp.preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    suggest_lsp_servers = true,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local bind = vim.keymap.set
    bind('n', 'gl', vim.diagnostic.open_float)
    bind('n', 'gd', vim.lsp.buf.definition)
    bind('n', 'gD', vim.lsp.buf.declaration)
    bind('n', 'gi', vim.lsp.buf.implementation)
    bind('n', 'go', vim.lsp.buf.type_definition)
    bind('n', 'gr', vim.lsp.buf.references)
    bind('n', 'gca', vim.lsp.buf.code_action)
    bind('n', 'gcr', vim.lsp.buf.rename)
    bind('n', '[d', vim.diagnostic.goto_prev)
    bind('n', ']d', vim.diagnostic.goto_next)
end)

lsp.setup()

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]] -- format on save
