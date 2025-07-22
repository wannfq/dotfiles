vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select all" })

-- keep cursor centered on jumping
-- vim.keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down
-- vim.keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up
vim.keymap.set("n", "n", "nzzzv") -- next search result
vim.keymap.set("n", "N", "Nzzzv") -- previous search

-- black hole register
vim.keymap.set("x", "<leader>p", [["_dP]])         -- paste (in visual mode)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- disable capital Q on normal mode
vim.keymap.set("n", "Q", "<nop>")

-- go back to last buffer
vim.keymap.set("n", "<leader>bb", "<C-6>", { desc = "Go back to last buffer" })

-- navigation Quickfix
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- search text and replace all
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })
