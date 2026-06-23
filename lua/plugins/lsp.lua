return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = opts.servers or {}

      -- gofumpt=false: conform handles go formatting separately
      if servers.gopls then
        servers.gopls.settings = vim.tbl_deep_extend("force", servers.gopls.settings or {}, {
          gopls = { gofumpt = false, staticcheck = true },
        })
      end

      servers.tailwindcss = {
        settings = {
          tailwindCSS = {
            includeLanguages = {
              typescript = "javascript",
              typescriptreact = "javascript",
              javascript = "javascript",
              javascriptreact = "javascript",
            },
          },
        },
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      }

      -- sqls binary lives in ~/go/bin; added to PATH in ~/.zshrc
      servers.sqls = {
        cmd = { "sqls" },
        filetypes = { "sql", "mysql" },
        root_markers = { ".sqls.yml", ".git" },
      }

      -- html/cssls: not provided by any LazyVim extra, add explicitly
      servers.html = {}
      servers.cssls = {}

      opts.servers = servers
    end,
  },
}
