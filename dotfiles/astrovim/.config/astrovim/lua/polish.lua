local opt = vim.opt
local o = vim.o

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

local dap = require "dap"
local dapui = require "dapui"

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
-- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
-- dap.listeners.before.event_exited["dapui_config"] = dapui.close

vim.fn.sign_define("DapBreakpoint", {
  text = "󰋘", -- nerdfonts icon here
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointCondition", {
  text = "󱃲", -- nerdfonts icon here
  texthl = "DapBreakpointCondition",
  linehl = "DapBreakpointCondition",
  numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapStopped", {
  text = "󰁘", -- nerdfonts icon here
  texthl = "DapStopped",
  linehl = "DapStopped",
  numhl = "DapStopped",
})
