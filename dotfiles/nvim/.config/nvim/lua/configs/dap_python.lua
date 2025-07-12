local dap = require "dap"
local dap_python = require "dap-python"

local mason_debugpy_path =
  table.concat({ vim.fn.stdpath "data", "mason", "packages", "debugpy", "venv", "bin", "python" }, "/"):gsub("//+", "/")
local debugpy_python_path = vim.g.python_host_prog
  or require("utils.python").load_python_executable "python"
  or mason_debugpy_path

dap_python.setup(debugpy_python_path, { include_configs = false })
dap_python.test_runner = "pytest"
dap_python.default_port = 38000

local configs = dap.configurations.python or {}
dap.configurations.python = configs

table.insert(configs, {
  type = "python",
  request = "launch",
  name = "file",
  program = "${file}",
})
table.insert(configs, {
  type = "python",
  request = "launch",
  name = "file:args",
  program = "${file}",
  args = function()
    local args_string = vim.fn.input "Arguments: "
    local utils = require "dap.utils"
    if utils.splitstr and vim.fn.has "nvim-0.10" == 1 then
      return utils.splitstr(args_string)
    end
    return vim.split(args_string, " +")
  end,
})
-- table.insert(configs, {
--   type = "python",
--   request = "attach",
--   name = "attach",
--   connect = function()
--     local host = vim.fn.input "Host [127.0.0.1]: "
--     host = host ~= "" and host or "127.0.0.1"
--     local port = tonumber(vim.fn.input "Port [5678]: ") or 5678
--     return { host = host, port = port }
--   end,
-- })
table.insert(configs, {
  type = "python",
  request = "launch",
  name = "file:doctest",
  module = "doctest",
  args = { "${file}" },
  noDebug = true,
})
