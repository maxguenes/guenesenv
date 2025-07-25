return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "html",
          "http",
          "css",
          "python",
          "groovy",
          "typescript",
          "javascript",
          "tsx",
        },
        auto_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        incremental_selection = {
          enable = true,
          -- keymaps = {
          --   init_selection = "<C-n>",
          --   node_incremental = "<C-n>",
          --   scope_incremental = "<C-s>",
          --   node_decremental = "<C-m>",
          -- },
        },
      }
    end,
  },
}
