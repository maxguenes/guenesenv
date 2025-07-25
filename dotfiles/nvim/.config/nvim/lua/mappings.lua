require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local wk = require "which-key"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

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

vim.keymap.set("n", "TT", ":Telescope<CR>", { desc = "Open Telescope" })
-- Buffers
map("n", "<leader>Xa", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "buffer close all" })

map("n", "<leader>Xr", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "buffer close all to right " })

map("n", "<leader>Xl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "buffer close all to left " })

-- Move Line
map("n", "<M-J>", ":m .+1<CR>==") -- move line up(n)
map("n", "<M-K>", ":m .-2<CR>==") -- move line down(n)
map("v", "<M-J>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<M-K>", ":m '<-2<CR>gv=gv") -- move line down(v)

wk.add {
  { "<leader>g", group = "Git", icon = "󰊢" },
  { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Git preview hunk", mode = { "n", "v" } },
  { "<leader>gb", ":Gitsigns blame<CR>", desc = "Git blame", mode = { "n", "v" } },
  { "<leader>gB", ":Gitsigns blame_line<CR>", desc = "Git blame (line)", mode = { "n", "v" } },
  {
    "<leader>gT",
    ":Gitsigns toggle_current_line_blame<CR>",
    desc = "Git toggle current line blame",
    mode = { "n", "v" },
  },
}
-- function hello()
--   print "Is it me you're looking for?"
-- end
-- vim.keymap.set("n", "<M-j>", hello)
