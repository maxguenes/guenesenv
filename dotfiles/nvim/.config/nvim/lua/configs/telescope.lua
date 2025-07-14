local telescope = require "telescope"

local telescopeParams = require "nvchad.configs.telescope"
-- first setup telescope
telescope.setup(telescopeParams)

-- then load the extension
telescope.load_extension "live_grep_args"
telescope.load_extension "dap"
telescope.load_extension "rest"
telescope.load_extension "git_signs"
