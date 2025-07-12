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

-- Visual Multi
local function visual_cursors_with_delay()
  -- Execute the vm-visual-cursors command.
  vim.cmd 'silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"'
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd "sleep 200m"
  -- Press 'A' in normal mode after the delay.
  vim.cmd 'silent! execute "normal! A"'
end
wk.add {
  { "<leader>m", group = "Visual Multi" },
  { "<leader>mw", "<Plug>(VM-Find-Under)<Tab>", desc = "Select Under" },
  { "<M-j>", "<Plug>(VM-Find-Under)<Tab>", desc = "Select Under" },
  { "<leader>ma", "<Plug>(VM-Select-All)<Tab>", desc = "Select All" },
  { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle Mapping" },
  { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "Add Cursor At Pos" },
  { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
  { "<leader>mv", visual_cursors_with_delay, desc = "Visual Cursors", mode = "v" },
}
-- function hello()
--   print "Is it me you're looking for?"
-- end
-- vim.keymap.set("n", "<M-j>", hello)
