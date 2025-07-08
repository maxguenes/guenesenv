require("venv-selector").setup {
  -- Your options go here
  -- name = "venv",
  dap_enabled = true,
  auto_refresh = false,
  stay_on_this_version = true,
}

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then
      require("venv-selector").retrieve_from_cache()
    end
  end,
  once = true,
})
