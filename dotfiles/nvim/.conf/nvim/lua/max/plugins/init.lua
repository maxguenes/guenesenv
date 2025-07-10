return {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      -- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      -- dap.listeners.before.event_exited["dapui_config"] = dapui.close

      vim.fn.sign_define("DapBreakpoint", {
        text = "󰋘", -- nerdfonts icon here
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "󱃲", -- nerdfonts icon here
        texthl = "DapBreakpointCondition",
        linehl = "DapBreakpointCondition",
        numhl = "DapBreakpointCondition",
      })
      vim.fn.sign_define("DapStopped", {
        text = "󰁘", -- nerdfonts icon here
        texthl = "DapStopped",
        linehl = "DapStopped",
        numhl = "DapStopped",
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "max.configs.dap"
    end,
    keys = {
      {
        mode = "n",
        "<F9>",
        ':lua require"dap".continue()<CR>',
        desc = "DAP - Start/Continue",
        { noremap = true, silent = true },
      },
      {
        mode = "n",
        "<F8>",
        ':lua require"dap".step_over()<CR>',
        desc = "DAP - Step Over",
        { noremap = true, silent = true },
      },
      {
        mode = "n",
        "<F7>",
        ':lua require"dap".step_into()<CR>',
        desc = "DAP - Step Into",
        { noremap = true, silent = true },
      },
      {
        mode = "n",
        "<S-F7>",
        ':lua require"dap".step_out()<CR>',
        desc = "DAP - Step Out",
        { noremap = true, silent = true },
      },
      {
        mode = "n",
        "<leader>db",
        ':lua require"dap".toggle_breakpoint()<CR>',
        desc = "DAP - Toggle [d]ebug [b]reakpoint",
        { noremap = true, silent = true },
      },
      {
        mode = "n",
        "<leader>dB",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        desc = "DAP - Toggle [d]ebug [B]reakpoint conditional",
        { noremap = true, silent = true },
      },
      {
        mode = "n",
        "<leader>dT",
        ":lua require'dapui'.toggle()<CR>",
        desc = "DAP - UI Toggle",
        { noremap = true, silent = true },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      return require "max.configs.dap_python"
    end,
    keys = {
      {
        mode = "n",
        "<leader>df",
        function()
          require("dap-python").test_method()
        end,
      },
      {
        mode = "n",
        "<leader>dc",
        function()
          require("dap-python").test_class()
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("telescope").load_extension "dap"
    end,
    keys = {
      {
        mode = { "n", "v" },
        "<F10>",
        function(opts)
          local ft = vim.api.nvim_buf_get_option(0, "filetype")
          -- if ft == "vim" or ft == "lua" then
          --   vim.cmd "silent! write"
          --   vim.cmd "source %"
          -- elseif ft == "python" then
          --   vim.cmd "silent! write"
          --   vim.cmd "sp"
          --   M.run_term("python3 %s", vim.fn.expand "%")
          -- elseif ft == "c" then
          --   vim.cmd "silent! write"
          --   vim.cmd "sp"
          --   local file = vim.fn.expand "%"
          --   local output = vim.fn.expand "%:t:r"
          --   local command = "gcc %s -o %s && ./%s; rm %s"
          --   M.run_term(command, file, output, output, output)
          -- elseif ft == "http" then
          --   -- Not really save and exec, but think it fits nicely in here for mapping
          --   require("rest-nvim").run()
          -- end
          require("telescope").extensions.dap.configurations {
            language_filter = function(lang)
              return lang == ft
            end,
          }
        end,
      },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   ft = { "python" },
  --   opts = function()
  --     return require "max.configs.none-ls"
  --   end,
  -- },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "black",
  --       "debugpy",
  --       "mypy",
  --       "ruff-lsp",
  --       "pyright",
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        "j-hui/fidget.nvim",
        tag = "v1.4.0",
        opts = {
          progress = {
            display = {
              done_icon = "✓", -- Icon shown when all LSP progress tasks are complete
            },
          },
          notification = {
            window = {
              winblend = 0, -- Background color opacity in the notification window
            },
          },
        },
      },
    },
    config = function()
      require "configs.lspconfig"
      require "max.configs.lspconfig"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
          },
          require "neotest-plenary",
          require "neotest-vim-test" {
            ignore_file_types = { "python", "vim", "lua" },
          },
        },
      }
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function()
      require "max.configs.venv-selector"
    end,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>Vs", "<cmd>VenvSelect<cr>", desc = "[v]env [s]elector" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>Vc", "<cmd>VenvSelectCached<cr>", desc = "[v]env [c]ached" },
      { "<leader>VC", "<cmd>VenvSelectCurrent<cr>", desc = "[v]env show [C]urrent" },
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>Wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
      { "<leader>Ws", "<cmd>SessionSave<CR>", desc = "Save session" },
      { "<leader>Wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },
    config = function()
      require("auto-session").setup {
        auto_save = true, -- Enables/disables auto saving session on exit
        auto_restore = true, -- Enables/disables auto restoring session on start
        auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
        session_lens = {
          load_on_setup = true, -- Initialize on startup (requires Telescope)
          picker_opts = nil, -- Table passed to Telescope / Snacks to configure the picker. See below for more information
          session_control = {
            control_dir = vim.fn.stdpath "data" .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
            control_filename = "session_control.json", -- File name of the session control file
          },
        },
      }
    end,
  },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
