return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = { light = "latte", dark = "mocha" },
      term_colors = true,
      integrations = {
        aerial = true,
        blink_cmp = { enabled = true, style = "bordered" },
        cmp = true,
        dap = true,
        dap_ui = true,
        gitsigns = { enabled = true },
        mason = true,
        neotree = true,
        notify = true,
        snacks = { enabled = true },
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
