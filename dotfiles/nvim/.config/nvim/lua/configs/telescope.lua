local telescope = require "telescope"
local utils_functions = require "utils.functions"

local preset_options = utils_functions.get_preset_options "telescope"

-- first setup telescope
telescope.setup(preset_options)

-- then load the extension
telescope.load_extension "live_grep_args"
telescope.load_extension "dap"
telescope.load_extension "rest"
telescope.load_extension "git_signs"
telescope.load_extension "lazygit"
telescope.load_extension "workspaces"
