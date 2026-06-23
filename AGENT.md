# AGENT.md

Personal Neovim config on **LazyVim**. Target: PHP, Go, TypeScript/React, web stack.

## Architecture

`init.lua` sets `vim.g.lazyvim_php_lsp = "intelephense"` before `require("config.lazy")`.

```
lua/config/            core overrides
  lazy.lua             lazy.nvim setup (lazy=true default, aggressive rtp disable)
  keymaps.lua          custom keymaps
  options.lua          empty (all desired opts are LazyVim defaults)
  autocmds.lua         empty (LazyVim handles BufWritePre auto-create dir)
lua/plugins/           plugin specs
  colorscheme.lua      catppuccin-mocha
  conform.lua          format-on-save per ft
  gitsigns.lua         inline blame + signs
  lsp.lua              LSP server overrides (gopls, tailwindcss, sqls, html, cssls)
  mason.lua            Mason ensure_installed
  php.lua              phpactor RPC refactor (LSP disabled, intelephense is PHP LSP)
  colorizer.lua        Tailwind CSS color preview
  vim-tmux-navigator.lua  tmux pane nav (C-h/j/k/l)
lazyvim.json           enabled LazyVim extras
```

## LSP

| Server | Config |
|---|---|
| intelephense | PHP LSP (via lang.php extra + init.lua global) |
| gopls | staticcheck on, gofumpt off (conform handles go fmt) |
| vtsls | TS/JS LSP (via lang.typescript extra) |
| tailwindcss | React filetypes mapped (via lsp.lua override) |
| html | standalone HTML LSP |
| cssls | CSS/SCSS LSP |
| sqls | MySQL/SQL LSP (binary at ~/go/bin/sqls, PATH in .zshrc) |
| jsonls/yamlls/bashls/marksman | via extras |

## Format-on-Save (conform)

`lsp_format = "fallback"`. Fluent chain per ft:

- lua → stylua
- go → goimports → gofumpt (gopls own gofumpt=false)
- php → php_cs_fixer
- ts/tsx/js/jsx → prettierd → eslint_d
- json/html/css/scss/md/yaml/graphql → prettierd
- sql → sqlfluff (via lang.sql extra)

## Plugins

| Plugin | Why |
|---|---|
| catppuccin/nvim | mocha theme |
| gitsigns.nvim | inline blame, hunk signs, diffthis |
| gbprod/phpactor.nvim | RPC refactor only (LSP off, intelephense serves LSP) |
| NvChad/nvim-colorizer.lua | Tailwind color highlighting |
| christoomey/vim-tmux-navigator | seamless tmux+nvim pane nav |
| LazyVim defaults | blink.cmp, snacks, neo-tree, bufferline, trouble, noice, aerial, which-key, leap, ts-autotag |

## Keymaps

| Key | Action |
|---|---|
| `<C-p>` | snacks.picker.files |
| `<C-LeftMouse>` | lsp hover |
| `<C-RightMouse>` | lsp code action |
| `<C-h/j/k/l>` | tmux navigator (panes + nvim splits) |
| `<leader>te` | toggle terminal |
| `<leader>tao` | opencode terminal |
| `<leader>tal` | lazygit terminal |
| `<leader>gdd` | Gitsigns diffthis (gdd avoids snacks picker conflict) |
| `<leader>pm/pi/pim/pn/pe` | phpactor refactor |
| jk (i) | <Esc> |
| ; (n) | : |

## tmux

Prefix C-a. Plugins: tpm, vim-tmux-navigator, resurrect/continuum, yank.

## Common

```bash
stylua lua/ init.lua                    # format Lua
nvim --headless "+Lazy! sync" +qa      # sync plugins
nvim +checkhealth                      # health
```

## Editing this config

- LSP server overrides → `lua/plugins/lsp.lua` in opts function
- LazyVim extras → `lazyvim.json`
- Custom plugins → `lua/plugins/<name>.lua`
- Format config → `lua/plugins/conform.lua`
- Keymaps → `lua/config/keymaps.lua`
- Commit `lazy-lock.json` alongside plugin changes
- Startup target: <80ms with UI
