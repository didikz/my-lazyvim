return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.sonokai_style = "maia"
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
