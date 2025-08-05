local ret = {}

if vim.g.nvmax_preset == "nvchad" then
  ret = {
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
    },
  }
end

return ret
