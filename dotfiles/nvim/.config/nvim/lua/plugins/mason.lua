return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    -- priority = 1000,
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require "configs.mason"
    end,
  },
}

