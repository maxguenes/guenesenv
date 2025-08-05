local functions = {}

function functions.dump_table(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. functions.dump_table(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

function functions.get_preset_options(plugin_name)
  local ret = {}
  local preset = vim.g.nvmax_preset
  if preset == "nvchad" then
    local configs = require("nvchad.configs." .. plugin_name)
    if configs ~= nil then
      ret = configs
    end
  end

  return ret
end

return functions
