local map = vim.keymap.set

-- Move Line
map("n", "<M-J>", ":m .+1<CR>==") -- move line up(n)
map("n", "<M-K>", ":m .-2<CR>==") -- move line down(n)
map("v", "<M-J>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<M-K>", ":m '<-2<CR>gv=gv") -- move line down(v)
