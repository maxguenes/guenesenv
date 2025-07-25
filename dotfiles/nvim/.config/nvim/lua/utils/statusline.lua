local utils = require "nvchad.stl.utils"

local sep_icons = utils.separators
local separators = sep_icons["default"]

local sep_l = separators["left"]

local statusline = {}

statusline.actived_venv = function()
  local venv_name = require("venv-selector").get_active_venv()
  if venv_name ~= nil then
    return string.gsub(venv_name, ".*/pypoetry/virtualenvs/", "(poetry) ")
  end
end

statusline.module_venv = function()
  local activated_venv = statusline.actived_venv()
  if activated_venv ~= nil then
    local icon = "%#St_cwd_icon#" .. "󱔎 "
    activated_venv = "%#St_cwd_text#" .. " " .. activated_venv .. " "
    return "%#St_cwd_sep#" .. sep_l .. icon .. activated_venv
  end
end

statusline.heirline_venv = {
  {
    provider = function()
      return statusline.module_venv()
    end,
  },
  on_click = {
    callback = function()
      vim.cmd.VenvSelect()
    end,
    name = "heirline_statusline_venv_selector",
  },
}

return statusline
