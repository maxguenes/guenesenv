return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
  -- {
  --   "adelarsq/image_preview.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("image_preview").setup()
  --   end,
  -- },
}
