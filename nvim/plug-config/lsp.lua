require("nvim-lsp-installer").setup {}

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local coq = require "coq"
local cfg = {
    bind = true,
    handler_opts = {
        border = "rounded"
    }
}

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

require "lsp_signature".setup(cfg)

--   ASCII Font is "Doom" on http://www.patorjk.com/software/taag
--   ___
--  / __|
-- | (__
--  \___|

-- lsp.clangd.setup{coq.lsp_ensure_capabilities()}

--              _   _
--             | | | |
--  _ __  _   _| |_| |__   ___  _ __
-- | '_ \| | | | __| '_ \ / _ \| '_ \
-- | |_) | |_| | |_| | | | (_) | | | |
-- | .__/ \__, |\__|_| |_|\___/|_| |_|
-- | |     __/ |
-- |_|    |___/

-- lsp.pyright.setup{coq.lsp_ensure_capabilities()}

--                 _
--                | |
--  _ __ _   _ ___| |_
-- | '__| | | / __| __|
-- | |  | |_| \__ \ |_
-- |_|   \__,_|___/\__|
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local rust_opts = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

require('rust-tools').setup(rust_opts)

--  _               _        _ _
-- | |             | |      | | |
-- | |__   __ _ ___| | _____| | |
-- | '_ \ / _` / __| |/ / _ \ | |
-- | | | | (_| \__ \   <  __/ | |
-- |_| |_|\__,_|___/_|\_\___|_|_|

-- lsp.hls.setup{coq.lsp_ensure_capabilities()}

--    ___                  _____           _       _
--   |_  |                /  ___|         (_)     | |
--     | | __ ___   ____ _\ `--.  ___ _ __ _ _ __ | |_
--     | |/ _` \ \ / / _` |`--. \/ __| '__| | '_ \| __|
-- /\__/ / (_| |\ V / (_| /\__/ / (__| |  | | |_) | |_
-- \____/ \__,_| \_/ \__,_\____/ \___|_|  |_| .__/ \__|
--                                          | |
--                                          |_|
local tss_opts = {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

        on_attach(client, bufnr)
    end,
}
-- lsp.tsserver.setup(coq.lsp_ensure_capabilities(), tss_opts)

-- ______  _   _ ______
-- | ___ \| | | || ___ \
-- | |_/ /| |_| || |_/ /
-- |  __/ |  _  ||  __/
-- | |    | | | || |
-- \_|    \_| |_/\_|

-- lsp.intelephense.setup{coq.lsp_ensure_capabilities()}

--  _               _
-- | |             | |
-- | |__   __ _ ___| |__
-- | '_ \ / _` / __| '_ \
-- | |_) | (_| \__ \ | | |
-- |_.__/ \__,_|___/_| |_|

-- lsp.bashls.setup{coq.lsp_ensure_capabilities()}

--  _
-- | |
-- | |_   _  __ _
-- | | | | |/ _` |
-- | | |_| | (_| |
-- |_|\__,_|\__,_|

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- lsp.sumneko_lua.setup {coq.lsp_ensure_capabilities()}
local lua_opts = {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local servers = { pyright = {},
                  tsserver = tss_opts,
                  clangd = {},
                  hls = {},
                  intelephense = {},
                  sumneko_lua = lua_opts,
                }

for lsp, cfg in pairs(servers) do
    cfg.on_attach = on_attach
    require('lspconfig')[lsp].setup{coq.lsp_ensure_capabilities({cfg})}
end
