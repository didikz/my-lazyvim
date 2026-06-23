vim.keymap.set("n", "<C-LeftMouse>", function()
  vim.lsp.buf.hover()
end, { desc = "LSP: Hover" })

vim.keymap.set("n", "<C-RightMouse>", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP: Code action" })

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Picker: files" })

vim.keymap.set("n", "<leader>te", function()
  Snacks.terminal.toggle()
end, { desc = "Terminal: toggle" })
vim.keymap.set("n", "<leader>tao", function()
  Snacks.terminal.toggle("opencode")
end, { desc = "Terminal: opencode" })
vim.keymap.set("n", "<leader>tal", function()
  Snacks.terminal.toggle("lazygit")
end, { desc = "Terminal: lazygit" })

-- gdd (not gd) to avoid colliding with snacks_picker's hunk picker
vim.keymap.set("n", "<leader>gdd", function()
  vim.cmd "Gitsigns diffthis"
end, { desc = "Git: diff this file" })
