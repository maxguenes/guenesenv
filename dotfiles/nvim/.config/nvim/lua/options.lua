-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.options"

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
