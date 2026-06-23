return {
  "christoomey/vim-tmux-navigator",
  init = function()
    vim.g.tmux_navigator_no_mappings = true
  end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Pane: left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Pane: down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Pane: up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Pane: right" },
  },
}
