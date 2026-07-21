local docker_icon = { glyph = "󰡨", hl = "MiniIconsYellow" }
local docker_patterns = {
  "^docker%-compose.*%.yml$",
  "^docker%-compose.*%.yaml$",
  "^compose.*%.yml$",
  "^compose.*%.yaml$",
}

local function is_docker_compose(filename)
  for _, p in ipairs(docker_patterns) do
    if filename:match(p) then
      return true
    end
  end
  return false
end

return {
  {
    "nvim-mini/mini.icons",
    opts = {
      file = {
        ["docker-compose.yml"] = docker_icon,
        ["docker-compose.yaml"] = docker_icon,
        ["compose.yml"] = docker_icon,
        ["compose.yaml"] = docker_icon,
      },
    },
    config = function(_, opts)
      require("mini.icons").setup(opts)
      local orig = MiniIcons.get
      MiniIcons.get = function(category, name)
        if category == "file" then
          local filename = name and vim.fn.fnamemodify(name, ":t") or ""
          if is_docker_compose(filename) then
            return docker_icon.glyph, docker_icon.hl
          end
        end
        return orig(category, name)
      end
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      local original = opts.options.get_element_icon
      opts.options.get_element_icon = function(icon_opts)
        local filename = icon_opts.path and vim.fn.fnamemodify(icon_opts.path, ":t") or ""
        if is_docker_compose(filename) then
          return docker_icon.glyph .. " ", docker_icon.hl
        end

        local ok, mini_icons = pcall(require, "mini.icons")
        if ok then
          if icon_opts.filetype and icon_opts.filetype ~= "" then
            local icon, hl = mini_icons.get("filetype", icon_opts.filetype)
            if icon and icon ~= "" then
              return icon, hl
            end
          end
          if filename ~= "" then
            local icon, hl = mini_icons.get("file", filename)
            if icon and icon ~= "" then
              return icon, hl
            end
          end
        end
        if original then
          return original(icon_opts)
        end
        return LazyVim.config.icons.ft[icon_opts.filetype]
      end
    end,
  },
}
