require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--

local function filterDuplicates(array)
  local uniqueArray = {}
  for _, tableA in ipairs(array) do
    local isDuplicate = false
    for _, tableB in ipairs(uniqueArray) do
      if vim.deep_equal(tableA, tableB) then
        isDuplicate = true
        break
      end
    end
    if not isDuplicate then
      table.insert(uniqueArray, tableA)
    end
  end
  return uniqueArray
end

local function on_list(options)
  options.items = filterDuplicates(options.items)
  vim.fn.setqflist({}, " ", options)
  vim.cmd "botright copen"
end

-- Remove Duplicates
vim.lsp.buf.references(nil, { on_list = on_list })
