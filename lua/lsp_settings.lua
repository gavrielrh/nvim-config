require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
})

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

vim.g.markdown_fenced_languages = {
  'ts=typescript',
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.format({ async = true })')
  vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
  vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
  vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')

  buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
  buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
  buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
  buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
  if client.server_capabilities.document_formatting then
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'pyright',
  'rust_analyzer',
  'intelephense',
  'solargraph',
  'gopls',
  'clangd',
  'yamlls',
  'ansiblels',
  'bashls',
  'sumneko_lua',
  'elixirls',
}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    local ts_utils = require('nvim-lsp-ts-utils')
    ts_utils.setup({})
    ts_utils.setup_client(client)

    buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
    buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
    buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')

    on_attach(client, bufnr)
  end,
})

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
  },
  on_attach = on_attach,
})

local luadev = require('lua-dev').setup({
  -- add any options here, or leave empty to use the default settings
  lspconfig = {
    cmd = { 'lua-language-server' },
    on_attach = on_attach,
    capabilities = capabilities,
  },
})

lspconfig.sumneko_lua.setup(luadev)

-- require'lspconfig'.denols.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }
