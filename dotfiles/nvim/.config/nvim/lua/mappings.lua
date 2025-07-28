require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local wk = require "which-key"

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

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

-- Git
wk.add {
  { "<leader>g", group = "Git", icon = "" },
  { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
}

local gitsigns = require "gitsigns"
if gitsigns then
  wk.add {
    { "<leader>gs", gitsigns.stage_hunk, desc = "Stage Hunk", mode = { "n" } },
    { "<leader>gr", gitsigns.reset_hunk, desc = "Reset Hunk", mode = { "n" } },
    {
      "<leader>gs",
      function()
        gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      desc = "Stage Hunk (Visual)",
      mode = { "v" },
    },
    {
      "<leader>gr",
      function()
        gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      desc = "Reset Hunk (Visual)",
      mode = { "v" },
    },
    { "<leader>gS", gitsigns.stage_buffer, desc = "Stage Buffer", mode = { "n" } },
    { "<leader>gR", gitsigns.reset_buffer, desc = "Reset Buffer", mode = { "n" } },
    { "<leader>gp", gitsigns.preview_hunk, desc = "Preview Hunk", mode = { "n" } },
    { "<leader>gi", gitsigns.preview_hunk_inline, desc = "Preview Hunk (Inline)", mode = { "n" } },
    {
      "<leader>gb",
      function()
        gitsigns.blame_line { full = true }
      end,
      desc = "Git Blame line",
      mode = "n",
    },

    { "<leader>gd", gitsigns.diffthis, desc = "Git diff this", mode = "n" },

    {
      "<leader>gD",
      function()
        gitsigns.diffthis "~"
      end,
      desc = "Git diff this",
      mode = "n",
    },

    {
      "<leader>gQ",
      function()
        gitsigns.setqflist "all"
      end,
      mode = "n",
    },
    { "<leader>gq", gitsigns.setqflist, mode = "n" },

    -- Toggles
    { "<leader>gtb", gitsigns.toggle_current_line_blame, mode = "n" },
    { "<leader>gtw", gitsigns.toggle_word_diff, mode = "n" },
  }

  -- Navigation
  map("n", "]c", function()
    if vim.wo.diff then
      vim.cmd.normal { "]c", bang = true }
    else
      gitsigns.nav_hunk "next"
    end
  end)

  map("n", "[c", function()
    if vim.wo.diff then
      vim.cmd.normal { "[c", bang = true }
    else
      gitsigns.nav_hunk "prev"
    end
  end)

  -- Text object
  map({ "o", "x" }, "ih", gitsigns.select_hunk)
end
