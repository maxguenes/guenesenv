require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers

-- local config = require("configs.lspconfig")

-- local on_attach = config.on_attach
-- local capabilities = config.capabilities

local lspconfig = require "lspconfig"

-- lspconfig.ruff.setup({
--   init_options = {
--     settings = {
--       logLevel = 'debug',
--     }
--   }
-- })

-- lspconfig.pyright.setup {
--   settings = {
--     pyright = {
--       -- Using Ruff's import organizer
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         -- Ignore all files for analysis to exclusively use Ruff for linting
--         ignore = { '*' },
--       },
--     },
--   },
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = require("utils.lsp").servers
-- -- Ensure the servers and tools above are installed
-- require('mason').setup()

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.

require("mason-lspconfig").setup {
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for tsserver)
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      lspconfig[server_name].setup(server)
    end,
  },
}
