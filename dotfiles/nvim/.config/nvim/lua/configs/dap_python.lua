local dap_python = require "dap-python"

dap_python.setup(vim.g.python_host_prog or require ("utils.python").load_python_executable "python")
dap_python.test_runner = "pytest"
