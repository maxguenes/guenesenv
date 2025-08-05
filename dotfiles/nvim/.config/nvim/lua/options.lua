local preset = vim.g.nvmax_preset

if preset == "nvchad" then
  -- load theme
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
  dofile(vim.g.base46_cache .. "lsp")
  dofile(vim.g.base46_cache .. "dap")
  dofile(vim.g.base46_cache .. "whichkey")

  require "nvchad.options"
  require("nvchad.lsp").diagnostic_config()
end
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
vim.g.VM_silent_exit = 1

-- vim.filetype.add {
--   pattern = {
--     [".env.*"] = "dotenv",
--   },
-- }
