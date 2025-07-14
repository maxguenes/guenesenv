return {
  {
    "radyz/telescope-gitsigns",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-dap.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    cmd = "Telescope",
    config = function()
      return require "configs.telescope"
    end,
  },
}
