return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require "configs.conform"
    end,
    keys = {
      {
        "<leader>tf",
        function()
          -- If autoformat is currently disabled for this buffer,
          -- then enable it, otherwise disable it
          if vim.b.disable_autoformat then
            vim.cmd "FormatEnable"
            vim.notify "Enabled autoformat for current buffer"
          else
            vim.cmd "FormatDisable!"
            vim.notify "Disabled autoformat for current buffer"
          end
        end,
        desc = "Toggle autoformat for current buffer",
      },
      {
        "<leader>tF",
        function()
          -- If autoformat is currently disabled globally,
          -- then enable it globally, otherwise disable it globally
          if vim.g.disable_autoformat then
            vim.cmd "FormatEnable"
            vim.notify "Enabled autoformat globally"
          else
            vim.cmd "FormatDisable"
            vim.notify "Disabled autoformat globally"
          end
        end,
        desc = "Toggle autoformat globally",
      },
    },
  },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
