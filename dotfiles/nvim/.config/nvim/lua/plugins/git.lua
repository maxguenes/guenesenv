return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    config = function()
      require "configs.git"
    end,
  },
}
