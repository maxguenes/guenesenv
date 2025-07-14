local opts = require "nvchad.configs.gitsigns"
opts.current_line_blame = true
opts.current_line_blame_opts = {
  delay = 1000,
}

require("gitsigns").setup(opts)
