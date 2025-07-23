local options = {
  log_level = vim.log.levels.DEBUG,
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    -- python = { "isort", "black" },
    python = {
      -- To fix auto-fixable lint errors.
      "ruff_fix",
      -- To run the Ruff formatter.
      "ruff_format",
      -- To organize the imports.
      "ruff_organize_imports",
    },
    groovy = { "npm-groovy-lint" },
    bash = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
    sh = { "shfmt", "shellcheck" },
    -- cpp = { "clang-format" },
    -- go = { "gofumpt", "goimports-reviser", "golines" },
    -- haskell = { "fourmolu", "stylish-haskell" },
  },

  formatters = {
    -- -- C & C++
    -- ["clang-format"] = {
    --     prepend_args = {
    --         "-style={ \
    --                 IndentWidth: 4, \
    --                 TabWidth: 4, \
    --                 UseTab: Never, \
    --                 AccessModifierOffset: 0, \
    --                 IndentAccessModifiers: true, \
    --                 PackConstructorInitializers: Never}",
    --     },
    -- },
    -- -- Golang
    -- ["goimports-reviser"] = {
    --     prepend_args = { "-rm-unused" },
    -- },
    -- golines = {
    --     prepend_args = { "--max-len=80" },
    -- },
    -- -- Lua
    -- stylua = {
    --     prepend_args = {
    --         "--column-width", "80",
    --         "--line-endings", "Unix",
    --         "--indent-type", "Spaces",
    --         "--indent-width", "4",
    --         "--quote-style", "AutoPreferDouble",
    --     },
    -- },
    -- Python
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "120",
      },
    },
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
return options
