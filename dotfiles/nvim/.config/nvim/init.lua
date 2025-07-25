require "core"

require "managers.lazy"

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
