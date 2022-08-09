local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "rust-analyzer",
  "elixirls",
  "intelephense",
  -- "typescript-language-server",
  -- "vue-language-server",
}

for _, lsp in ipairs(servers) do
  if lsp == "rust-analyzer" then
    require("rust-tools").setup()
  else
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  end
end
