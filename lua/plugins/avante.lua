local agent_path = vim.fn.exepath "agent"
if agent_path == "" then
  agent_path = os.getenv "HOME" .. "/.local/bin/agent"
end

return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = "make",
    opts = {
      -- Cursor CLI via ACP: https://cursor.com/docs/cli/acp#neovim-avantenvim
      -- Requires: `agent login` (already done on this machine)
      -- Switch backends: :AvanteSwitchProvider opencode|cursor|codex|claude-code
      provider = "cursor",
      acp_providers = {
        cursor = {
          command = agent_path,
          args = { "acp" },
          auth_method = "cursor_login",
          env = {
            HOME = os.getenv "HOME",
            PATH = os.getenv "PATH",
          },
        },
      },
      input = {
        provider = "snacks",
      },
      selector = {
        provider = "fzf_lua",
      },
    },
    cmd = {
      "AvanteACPModels",
      "AvanteACPModes",
    },
    keys = {
      {
        "<leader>am",
        function()
          local config = require "avante.config"
          local api = require "avante.api"
          if config.acp_providers[config.provider] then
            api.select_acp_model()
          else
            api.select_model()
          end
        end,
        desc = "Select Avante Model",
      },
      { "<leader>ao", "<cmd>AvanteACPModes<CR>", desc = "Select Avante ACP Mode" },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "Kaiser-Yang/blink-cmp-avante" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or {}
      opts.sources.providers = opts.sources.providers or {}
      if not vim.tbl_contains(opts.sources.default, "avante") then
        table.insert(opts.sources.default, "avante")
      end
      opts.sources.providers.avante = {
        module = "blink-cmp-avante",
        name = "Avante",
      }
    end,
  },
}
