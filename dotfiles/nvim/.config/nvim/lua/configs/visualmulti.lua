local wk = require "which-key"

-- Visual Multi
local function visual_cursors_with_delay()
  -- Execute the vm-visual-cursors command.
  vim.cmd 'silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"'
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd "sleep 200m"
  -- Press 'A' in normal mode after the delay.
  vim.cmd 'silent! execute "normal! A"'
end

wk.add {
  { "<leader>m", group = "Visual Multi" },
  { "<leader>mw", "<Plug>(VM-Find-Under)<Tab>", desc = "Select Under" },
  { "<M-j>", "<Plug>(VM-Find-Under)<Tab>", desc = "Select Under" },
  { "<leader>ma", "<Plug>(VM-Select-All)<Tab>", desc = "Select All" },
  { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle Mapping" },
  { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "Add Cursor At Pos" },
  { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
  { "<leader>mv", visual_cursors_with_delay, desc = "Visual Cursors", mode = "v" },
}
