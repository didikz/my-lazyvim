return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Declared explicitly so formatters install even if a LazyVim extra is removed
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "prettierd",
        "eslint_d",
        "goimports",
        "gofumpt",
        "php-cs-fixer",
        "sqls",
      })
    end,
  },
}
