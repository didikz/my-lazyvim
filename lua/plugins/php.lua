return {
  {
    "gbprod/phpactor.nvim",
    ft = "php",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>pm", "<cmd>PhpActor context_menu<cr>", desc = "PHP: Context menu" },
      { "<leader>pi", "<cmd>PhpActor import_class<cr>", desc = "PHP: Import class" },
      { "<leader>pim", "<cmd>PhpActor import_missing_classes<cr>", desc = "PHP: Import missing" },
      { "<leader>pn", "<cmd>PhpActor new_class<cr>", desc = "PHP: New class" },
      { "<leader>pe", "<cmd>PhpActor expand_class<cr>", desc = "PHP: Expand class" },
    },
    opts = {
      -- Disable phpactor's LSP; intelephense serves as PHP LSP
      lspconfig = { enabled = false },
    },
  },
}
