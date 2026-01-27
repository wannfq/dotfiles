-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer" })

-- replace text (word under cursor in normal mode, selection in visual mode)
vim.keymap.set("n", "<leader>rt", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
vim.keymap.set("v", "<leader>rt", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]], { desc = "Replace selected text" })

vim.keymap.set("n", "<leader>A", "gg<S-v>G", { desc = "Select all" })

-- keep cursor centered on jumping
-- vim.keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down
-- vim.keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- black hole register
vim.keymap.set("v", "D", [["_d]], { desc = "Delete to black hole register" })

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

-- disable capital Q on normal mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- go back to last buffer
vim.keymap.set("n", "<leader>bb", "<C-6>", { desc = "Go back to last buffer" })

-- delete all marks in current buffer
vim.keymap.set("n", "<leader>bm", function()
    vim.cmd "delm! | delm A-Z0-9"
end, { desc = "Delete all marks in current buffer" })

-- make current file executable
vim.keymap.set("n", "<leader>cX", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
