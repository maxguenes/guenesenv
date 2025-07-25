local wk = require "which-key"

require("multicursors").setup {
  generate_hints = {
    normal = true,
    insert = true,
    extend = true,
    config = {
      -- determines how many columns are used to display the hints. If you leave this option nil, the number of columns will depend on the size of your window.
      column_count = nil,
      -- maximum width of a column.
      max_hint_length = 25,
    },
  },
}

wk.add {
  { mode = { "n", "v" }, "<M-j>", "<cmd>MCstart<cr>", desc = "Select Under" },
}
