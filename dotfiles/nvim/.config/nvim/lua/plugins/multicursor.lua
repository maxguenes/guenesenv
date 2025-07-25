return {
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  --   -- See https://github.com/mg979/vim-visual-multi/issues/241
  --   init = function()
  --     vim.g.VM_default_mappings = 0
  --     vim.g.VM_maps = {
  --       ["Find Under"] = "",
  --     }
  --     vim.g.VM_add_cursor_at_pos_no_mappings = 1
  --   end,
  --   config = function()
  --     require "configs.visualmulti"
  --   end,
  -- },
  {
    "smoka7/multicursors.nvim",
    lazy = false,
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    config = function()
      require "configs.multicursors"
    end,
  },
}
