return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      handlers = {
        basedpyright = false, -- Disabling default basedpyright
      },
      ---@diagnostic disable: missing-fields
      config = {
        pyright = {
          before_init = function(_, c)
            if not c.settings then c.settings = {} end
            if not c.settings.python then c.settings.python = {} end
            c.settings.python.pythonPath = vim.fn.exepath "python"
          end,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "information",
                  reportUnusedFunction = "information",
                  reportUnusedVariable = "information",

                  reportAttributeAccessIssue = "warning",
                  reportRedeclaration = "warning",

                  reportGeneralTypeIssues = "none",
                  reportOptionalMemberAccess = "none",
                  reportOptionalSubscript = "none",
                  reportPrivateImportUsage = "none",
                  reportOptionalCall = "none",
                  reportArgumentType = "none",
                  reportAssignmentType = "none",
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pyright" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pyright" })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    -- config = function() require "config.venv-selector" end,
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
