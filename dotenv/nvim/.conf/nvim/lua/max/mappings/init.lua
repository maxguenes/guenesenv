local map = vim.keymap.set

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "nvchad theme transparecy toggle" })
