return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
    },
  },
  {
    "mfussenegger/nvim-dap",
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
    config = function() return require "config.dap_python" end,
    keys = {
      {
        mode = "n",
        "<leader>dtf",
        function() require("dap-python").test_method() end,
      },
      {
        mode = "n",
        "<leader>dtc",
        function() require("dap-python").test_class() end,
      },
    },
  },
}
