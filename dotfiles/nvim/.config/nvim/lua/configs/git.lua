local nvchad_opts = require "nvchad.configs.gitsigns"
local opts = {

  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
  },
  -- on_attach = function(bufnr)
  --   local gitsigns = require "gitsigns"
  --
  --   local function map(mode, l, r, opts)
  --     opts = opts or {}
  --     opts.buffer = bufnr
  --     vim.keymap.set(mode, l, r, opts)
  --   end
  --
  -- end,
}

require("gitsigns").setup(vim.tbl_deep_extend("force", nvchad_opts, opts))
