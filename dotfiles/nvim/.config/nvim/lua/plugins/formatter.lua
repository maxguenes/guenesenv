return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require "configs.conform"
    end,
  },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
