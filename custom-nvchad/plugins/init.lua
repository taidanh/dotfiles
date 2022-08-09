return {
  ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      -- various languages
      "rust-analyzer",

      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "intelephense",
    },
  },
  ["jiangmiao/auto-pairs"] = {},
  ["simrat39/rust-tools.nvim"] = {
    config = function()
      -- require("rust-tools").setup()
    end
  },
}
