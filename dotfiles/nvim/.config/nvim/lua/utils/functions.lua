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

function functions.module_loaded(module_name)
  return pcall(require, module_name)
end

return functions
