local utils_functions = require "utils.functions"

local preset_config = utils_functions.get_preset_options "gitsigns"

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

require("gitsigns").setup(vim.tbl_deep_extend("force", preset_config, opts))
