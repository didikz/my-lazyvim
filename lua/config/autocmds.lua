vim.opt.autoread = true

vim.api.nvim_create_augroup("AutoReload", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = "AutoReload",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd "checktime"
    end
  end,
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = "AutoReload",
  callback = function(args)
    if not vim.api.nvim_buf_is_valid(args.buf) or vim.bo[args.buf].modified then
      return
    end
    vim.api.nvim_buf_call(args.buf, function()
      vim.cmd "edit"
    end)
  end,
})
