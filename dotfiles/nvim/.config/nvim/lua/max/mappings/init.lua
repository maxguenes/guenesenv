local map = vim.keymap.set

-- Themes, Editor & Toggles
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "nvchad theme transparecy toggle" })

map("n", "<leader>tw", function()
  vim.cmd "set wrap!"
end, { desc = "toggle word wrap" })

-- Telescope
map(
  "n",
  "<leader>fs",
  require("telescope").extensions.live_grep_args.live_grep_args,
  { desc = "telescope find in all files", noremap = true }
)

map("n", "<leader>Xa", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "buffer close all" })

map("n", "<leader>Xr", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "buffer close all to right " })

map("n", "<leader>Xl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "buffer close all to left " })
