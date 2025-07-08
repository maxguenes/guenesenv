require "max.utils.python"
local dap_python = require "dap-python"

dap_python.setup(vim.g.python_host_prog or LoadClosesPythonModule "python")
dap_python.test_runner = "pytest"
