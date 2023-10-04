local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(_, bufnr)
  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  -- auto format on save
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('K', vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local lspconfig = require("lspconfig")

-- todo: run neodev only when opening file lua
require("neodev").setup()

lspconfig.lua_ls.setup  {
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
  capabilities = capabilities,
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false }
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
