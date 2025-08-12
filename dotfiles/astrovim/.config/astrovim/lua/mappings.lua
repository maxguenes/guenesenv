local map = vim.keymap.set

-- Move Line
map("n", "<M-J>", ":m .+1<CR>==", { desc = "Move Line Up" }) -- move line up(n)
map("n", "<M-K>", ":m .-2<CR>==", { desc = "Move Line Down" }) -- move line down(n)
map("v", "<M-J>", ":m '>+1<CR>gv=gv", { desc = "Move Line Up (Visual)" }) -- move line up(v)
map("v", "<M-K>", ":m '<-2<CR>gv=gv", { desc = "Move Line Down (Visual)" }) -- move line down(v)

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
