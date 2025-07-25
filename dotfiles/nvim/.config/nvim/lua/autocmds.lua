require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufNewFile", "BufEnter", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("jenkinsfile_detect", { clear = true }),
  pattern = { "*Jenkinsfile*", "*JenkinsFile*", "*Jenkinfile*", "*JenkinFile*" },
  callback = function()
    vim.cmd "set filetype=groovy"
  end,
})
