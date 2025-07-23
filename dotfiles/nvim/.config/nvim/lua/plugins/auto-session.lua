return {
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>Wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
      { "<leader>Ws", "<cmd>SessionSave<CR>", desc = "Save session" },
      { "<leader>Wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },
    config = function()
      require("auto-session").setup {
        auto_save = true, -- Enables/disables auto saving session on exit
        auto_restore = true, -- Enables/disables auto restoring session on start
        auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
        session_lens = {
          load_on_setup = true, -- Initialize on startup (requires Telescope)
          picker_opts = nil, -- Table passed to Telescope / Snacks to configure the picker. See below for more information
          session_control = {
            control_dir = vim.fn.stdpath "data" .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
            control_filename = "session_control.json", -- File name of the session control file
          },
        },
      }
    end,
  },
}

