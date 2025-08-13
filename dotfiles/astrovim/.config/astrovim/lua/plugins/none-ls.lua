-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "AstroNvim/astrolsp" },
  },
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").extend_tbl(opts.sources, {
      null_ls.builtins.formatting.black.with {
        extra_args = { "--line-length", "120" },
      },
      null_ls.builtins.formatting.isort.with {
        extra_args = { "-m", "3" }, -- 3 - Vertical Hanging Indent
      },
    })
  end,
}
