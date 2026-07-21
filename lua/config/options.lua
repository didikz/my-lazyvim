vim.filetype.add {
  pattern = {
    ["docker%-compose.*%.yml"] = "yaml.docker-compose",
    ["docker%-compose.*%.yaml"] = "yaml.docker-compose",
    ["compose.*%.yml"] = "yaml.docker-compose",
    ["compose.*%.yaml"] = "yaml.docker-compose",
  },
}

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    LazyVim.config.icons.ft["yaml.docker-compose"] = "󰡨 "
  end,
})
