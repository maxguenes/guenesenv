local venv_selector = require "venv-selector"
local statusline = {}

if venv_selector then
  statusline.actived_venv = function()
    local venv_name = venv_selector.get_active_venv()
    if venv_name ~= nil then return string.gsub(venv_name, ".*/pypoetry/virtualenvs/", "(poetry) ") end
  end

  statusline.heirline_venv = {
    {
      provider = function() return statusline.module_venv() end,
    },
    on_click = {
      callback = function() vim.cmd.VenvSelect() end,
      name = "heirline_statusline_venv_selector",
    },
  }
end
return statusline
