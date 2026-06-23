# Neovim Config (LazyVim)

Personal Neovim setup on [LazyVim](https://github.com/LazyVim/LazyVim).
Target languages: PHP, Go, TypeScript/React, and general web stack.

## Architecture

```
~/.config/nvim/
├── init.lua                     # Bootstrap + PHP LSP config
├── lazyvim.json                 # LazyVim extras (lang.*, dap, neotree, aerial)
├── lua/
│   ├── config/
│   │   ├── lazy.lua             # lazy.nvim options
│   │   ├── keymaps.lua          # Custom keymaps
│   │   ├── options.lua          # Empty (LazyVim defaults are fine)
│   │   └── autocmds.lua         # Empty (LazyVim handles auto-create dir)
│   └── plugins/
│       ├── colorscheme.lua      # catppuccin-mocha
│       ├── conform.lua          # Format-on-save per filetype
│       ├── gitsigns.lua         # Inline git blame, signs
│       ├── lsp.lua              # LSP server overrides
│       ├── mason.lua             # Mason ensure_installed
│       ├── php.lua              # phpactor RPC refactoring
│       ├── colorizer.lua        # Tailwind CSS color highlighting
│       └── vim-tmux-navigator.lua # Seamless tmux pane nav
```

## Enabled LazyVim Extras

| Extra | Provides |
|---|---|
| `lang.typescript` | vtsls LSP, JS/TS DAP |
| `lang.go` | gopls LSP, goimports+gofumpt, delve, golangci-lint |
| `lang.php` | intelephense, php-cs-fixer, phpcs |
| `lang.sql` | vim-dadbod (DB browser), sqlfluff lint+format |
| `lang.tailwind` | Tailwind CSS LSP |
| `lang.json` | jsonls LSP |
| `lang.yaml` | yamlls LSP |
| `lang.markdown` | marksman LSP |
| `dap.core` | Debug adapter protocol |
| `editor.neo-tree` | File tree |
| `editor.aerial` | Code outline sidebar |

## LSP Servers

- **PHP** → intelephense (completion/hover/diagnostics) + phpactor (RPC refactor only, no LSP)
- **Go** → gopls (staticcheck on, gofumpt off — conform handles formatting)
- **TypeScript/React** → vtsls
- **Tailwind CSS** → tailwindcss-language-server (with React filetypes mapped)
- **HTML** → html-lsp (vscode-html-language-server)
- **CSS/SCSS** → css-lsp (vscode-css-language-server)
- **SQL** → sqls (`~/go/bin/sqls`)
- **JSON / YAML / Markdown / Bash** → LazyVim extras

## Format-on-Save

All via conform.nvim:

| Filetype | Formatter |
|---|---|
| Lua | stylua |
| Go | goimports → gofumpt |
| PHP | php-cs-fixer |
| TS/TSX/JS/JSX | prettierd → eslint_d |
| JSON / HTML / CSS / SCSS / Markdown / YAML / GraphQL | prettierd |
| SQL | sqlfluff (via lang.sql extra) |

## Plugins

| Plugin | Purpose |
|---|---|
| `catppuccin/nvim` | mocha theme |
| `stevearc/conform.nvim` | Format-on-save |
| `lewis6991/gitsigns.nvim` | Inline git blame, hunks, signs |
| `gbprod/phpactor.nvim` | PHP RPC refactoring (context menu, import, expand) |
| `NvChad/nvim-colorizer.lua` | Tailwind CSS color preview |
| `christoomey/vim-tmux-navigator` | Seamless `<C-h/j/k/l>` between tmux panes and nvim splits |
| LazyVim defaults | blink.cmp, snacks, neo-tree, bufferline, trouble, aerial, which-key, noice, flash, leap, ts-autotag |

## Terminal / Git

- **tmux** with vim-tmux-navigator: `<C-h/j/k/l>` navigates tmux panes and nvim splits seamlessly
- **lazygit** as TUI git client (opened via `<leader>tal` inside nvim, or standalone)
- **opencode** CLI AI assistant runs in its own terminal pane (`<leader>tao`)

## Keymaps

| Key | Action |
|---|---|
| `<C-p>` | Fuzzy find files (Zed-like) |
| `<C-LeftMouse>` | LSP hover |
| `<C-RightMouse>` | LSP code action |
| `<C-h/j/k/l>` | Navigate tmux panes / nvim splits |
| `<leader>te` | Toggle terminal |
| `<leader>tao` | Open opencode terminal |
| `<leader>tal` | Open lazygit terminal |
| `<leader>gdd` | Git diff this file (Gitsigns) |
| `<leader>pm` | PHP context menu (phpactor) |
| `<leader>pi` | PHP import class |
| `<leader>pim` | PHP import missing classes |
| `<leader>pn` | PHP new class |
| `<leader>pe` | PHP expand class |
| `jk` (insert) | Escape insert mode |
| `;` (normal) | Enter command-line mode |
| LazyVim defaults | `gd` (goto def), `gr` (refs), `K` (hover), `<leader>ca` (code action), etc. |

## Tom's Notes

```bash
# Format Lua
stylua lua/ init.lua

# Sync plugins after editing plugin specs
nvim --headless "+Lazy! sync" +qa

# Recompile highlight cache after theme change
nvim --headless "+lua require('base46').load_all_highlights()" +qa

# Health check
nvim +checkhealth
```

## Performance

- Startup: ~40ms headless (~60ms with theme)
- Lazy-loading: custom plugins loaded on `keys`, `ft`, or `cmd` triggers
- Disabled redundant rtp plugins (syntax, ftplugin, netrw, etc.)
