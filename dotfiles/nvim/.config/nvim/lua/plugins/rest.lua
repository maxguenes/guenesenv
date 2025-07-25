return {
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "rest-nvim/tree-sitter-http",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      vim.g.rest_nvim = {}
    end,
  },
}
