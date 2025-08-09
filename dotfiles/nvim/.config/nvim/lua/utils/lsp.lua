local lsp = {}

-- Enable the following language servers
lsp.servers = {
  lua_ls = {},
  ruff = {
    filetypes = { "python" },
    settings = {
      args = {
        "--line-length=120",
      },
    },
    format = {
      lineLength = 120, -- This setting is specific to ruff-lsp and its formatting
    },
  },
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          ignore = { "*" },
        },
      },
    },
  },
  jsonls = {},
  sqlls = {},
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
  ts_ls = {},
  html = { filetypes = { "html", "twig", "hbs" } },
  cssls = {},
}

return lsp
