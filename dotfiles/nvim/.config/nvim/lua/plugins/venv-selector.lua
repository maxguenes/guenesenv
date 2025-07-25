return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require "configs.venv-selector"
    end,
    lazy = false,
    event = { "VeryLazy", "VimEnter" }, -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>Vs", "<cmd>VenvSelect<cr>", desc = "[v]env [s]elector" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>Vc", "<cmd>VenvSelectCached<cr>", desc = "[v]env [c]ached" },
      { "<leader>VC", "<cmd>VenvSelectCurrent<cr>", desc = "[v]env show [C]urrent" },
    },
  },
}

