local dap = require 'dap'
local dap_python = require 'dap-python'


local mason_debugpy_path = table.concat({ vim.fn.stdpath('data'),  'mason', 'packages', 'debugpy', 'venv', 'bin', 'python'}, '/'):gsub('//+', '/')
local debugpy_python_path = vim.g.python_host_prog or require ("utils.python").load_python_executable "python" or mason_debugpy_path

dap_python.setup(debugpy_python_path, { include_configs = false })
dap_python.test_runner = "pytest"
dap_python.default_port = 38000