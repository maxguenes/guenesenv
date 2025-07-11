local telescope = require "telescope"

local telescopeParams = require "nvchad.configs.telescope"
-- first setup telescope
telescope.setup(telescopeParams)

-- then load the extension
telescope.load_extension "live_grep_args"
