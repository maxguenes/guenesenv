local nvchad_configs = require "nvchad.configs.nvimtree"
local configs = {
  filters = {
    custom = {
      "__pycache__",
    },
  },
}

local ret = vim.tbl_deep_extend("force", nvchad_configs, configs)
return ret
