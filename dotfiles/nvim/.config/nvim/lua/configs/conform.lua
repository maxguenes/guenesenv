require("conform").setup {
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
  formatters = {
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
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 500,
      lsp_format = "fallback",
      lsp_fallback = true,
    }
  end,
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- :FormatDisable! disables autoformat for this buffer only
    vim.b.disable_autoformat = true
  else
    -- :FormatDisable disables autoformat globally
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true, -- allows the ! variant
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
