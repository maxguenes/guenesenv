return {
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
        desc = "Debug python Test Method",
      },
      {
        mode = "n",
        "<leader>dtc",
        function() require("dap-python").test_class() end,
        desc = "Debug python Test Class",
      },
    },
  },
}
