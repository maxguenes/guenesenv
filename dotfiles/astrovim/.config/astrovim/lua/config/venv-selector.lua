require("venv-selector").setup {
  -- Your options go here
  name = { "venv", ".venv" },
  dap_enabled = true,
  auto_refresh = false,
  stay_on_this_version = true,
  notify_user_on_activate = true,
}

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function() require("venv-selector").retrieve_from_cache() end,
  once = true,
})
