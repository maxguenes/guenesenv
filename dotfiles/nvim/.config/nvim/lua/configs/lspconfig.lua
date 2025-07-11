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

-- Enable the following language servers
local servers = {
  lua_ls = {
    -- cmd = {...},
    -- filetypes { ...},
    -- capabilities = {},
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            "${3rd}/luv/library",
            unpack(vim.api.nvim_get_runtime_file("", true)),
          },
          -- If lua_ls is really slow on your computer, you can try this instead:
          -- library = { vim.env.VIMRUNTIME },
        },
        completion = {
          callSnippet = "Replace",
        },
        telemetry = { enable = false },
        diagnostics = { disable = { "missing-fields" } },
      },
    },
  },
  pylsp = {
    filetypes = { "python" },
    settings = {
      configurationSources = { "flake8" },
      formatCommand = { "black" },
      pylsp = {
        plugins = {
          flake8 = {
            enabled = true,
            maxLineLength = 120,
            ignore = { "E501", "E231" },
          },
          pycodestyle = {
            enabled = true,
            maxLineLength = 120,
            ignore = { "E501", "E231" },
          },
          pyflakes = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          mccabe = { enabled = false },
          pylsp_mypy = { enabled = false },
          pylsp_black = { enabled = false },
          pylsp_isort = { enabled = false },
        },
      },
    },
  },
  -- pyright = {
  --   settings = {
  --     pyright = {
  --
  --       -- Using Ruff's import organizer
  --       disableOrganizeImports = true,
  --     },
  --     python = {
  --       analysis = {
  --         -- Ignore all files for analysis to exclusively use Ruff for linting
  --         ignore = { "*" },
  --       },
  --     },
  --   },
  -- },
  -- basedpyright = {
  --   -- Config options: https://github.com/DetachHead/basedpyright/blob/main/docs/settings.md
  --   settings = {
  --     basedpyright = {
  --       disableOrganizeImports = true, -- Using Ruff's import organizer
  --       disableLanguageServices = false,
  --       analysis = {
  --         ignore = { '*' },                 -- Ignore all files for analysis to exclusively use Ruff for linting
  --         typeCheckingMode = 'off',
  --         diagnosticMode = 'openFilesOnly', -- Only analyze open files
  --         useLibraryCodeForTypes = true,
  --         autoImportCompletions = true,     -- whether pyright offers auto-import completions
  --       },
  --     },
  --   },
  -- },
  -- ruff = {
  --   -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
  --   -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
  --   commands = {
  --     RuffAutofix = {
  --       function()
  --         vim.lsp.buf.execute_command {
  --           command = "ruff.applyAutofix",
  --           arguments = {
  --             { uri = vim.uri_from_bufnr(0) },
  --           },
  --         }
  --       end,
  --       description = "Ruff: Fix all auto-fixable problems",
  --     },
  --     RuffOrganizeImports = {
  --       function()
  --         vim.lsp.buf.execute_command {
  --           command = "ruff.applyOrganizeImports",
  --           arguments = {
  --             { uri = vim.uri_from_bufnr(0) },
  --           },
  --         }
  --       end,
  --       description = "Ruff: Format imports",
  --     },
  --   },
  -- },
  jsonls = {},
  sqlls = {},
  terraformls = {},
  yamlls = {},
  bashls = {
    filetypes = { "bash", "sh" },
    settings = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)",
      },
    },
  },
  dockerls = {},
  docker_compose_language_service = {},
  groovyls = {
    filetypes = { "groovy" },
  },
  -- tailwindcss = {},
  -- graphql = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs' } },
  -- cssls = {},
  -- ltex = {},
  -- texlab = {},
}

-- -- Ensure the servers and tools above are installed
-- require('mason').setup()

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  "stylua", -- Used to format lua code
  "black",
  "debugpy",
  "mypy",
  "npm-groovy-lint",
  "shfmt",
  -- "ruff-lsp",
})
require("mason-tool-installer").setup {
  ensure_installed = ensure_installed,
  automatic_installation = true,
}

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
