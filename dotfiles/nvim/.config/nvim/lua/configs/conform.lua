local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = {
      "ruff_fix",
      "ruff_format",
      "ruff_organize_imports",
    },
    groovy = { "npm-groovy-lint" },
    bash = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
    sh = { "shfmt", "shellcheck" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
