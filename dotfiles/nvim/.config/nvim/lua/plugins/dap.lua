return {
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
      require "configs.dap"
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
      return require "configs.dap_python"
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
          require("telescope").extensions.dap.configurations {
            language_filter = function(lang)
              return lang == ft
            end,
          }
        end,
      },
    },
  },
}