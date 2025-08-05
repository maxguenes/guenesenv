local utils_functions = require "utils.functions"

local preset_options = utils_functions.get_preset_options "nvimtree"

local configs = {
  filters = {
    custom = {
      "__pycache__",
    },
  },
}

local ret = vim.tbl_deep_extend("force", preset_options, configs)
return ret
