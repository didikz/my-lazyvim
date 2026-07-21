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
│   │   ├── options.lua          # filetype patterns + icon overrides
│   │   └── autocmds.lua         # auto-reload buffers changed externally
│   └── plugins/
│       ├── colorscheme.lua      # sonokai maia
│       ├── avante.lua           # Cursor ACP integration (<leader>am/ao)
│       ├── icons.lua            # docker-compose icon override (mini.icons + bufferline)
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
| `sainnhe/sonokai` | maia theme |
| `yetone/avante.nvim` | Cursor ACP integration (model/mode pickers) |
| `Kaiser-Yang/blink-cmp-avante` | blink.cmp source for Avante |
| `nvim-mini/mini.icons` | Filetype/file icons (docker-compose override in `icons.lua`) |
| `stevearc/conform.nvim` | Format-on-save |
| `lewis6991/gitsigns.nvim` | Inline git blame, hunks, signs |
| `gbprod/phpactor.nvim` | PHP RPC refactoring (context menu, import, expand) |
| `NvChad/nvim-colorizer.lua` | Tailwind color highlighting |
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
| `<leader>am` | Avante model picker (Cursor ACP) |
| `<leader>ao` | Avante ACP mode picker |
| `<leader>pm` | PHP context menu (phpactor) |
| `<leader>pi` | PHP import class |
| `<leader>pim` | PHP import missing classes |
| `<leader>pn` | PHP new class |
| `<leader>pe` | PHP expand class |
| `jk` (insert) | Escape insert mode |
| `;` (normal) | Enter command-line mode |
| LazyVim defaults | `gd` (goto def), `gr` (refs), `K` (hover), `<leader>ca` (code action), etc. |

## LazyVim Default Keymaps

Quick reference for the most-used LazyVim defaults. Press `<Space>` in
Neovim to see all bindings via which-key, or check
<https://www.lazyvim.org/keymaps> for the full list.

### File Explorer (Neo-tree)

| Key | Action |
|---|---|
| `<Space>e` | Toggle file tree (root dir) |
| `<Space>E` | Toggle file tree (cwd) |
| `<Space>fe` | Open file tree |
| `<Space>ge` | Git status explorer |
| `<Space>be` | Buffer explorer |
| `l` / `h` (in tree) | Open / close node |
| `Y` (in tree) | Copy path |
| `O` (in tree) | Open with system app |
| `<C-l>` (in tree) | Reveal current file |

### Buffers

| Key | Action |
|---|---|
| `<Space>bd` | Delete current buffer |
| `<Space>bo` | Delete other buffers |
| `<Space>bi` | Delete invisible buffers |
| `<Space>bD` | Delete buffer and window |
| `<S-h>` / `<S-l>` | Prev / next buffer |
| `]b` / `[b` | Prev / next buffer |
| `<Space>bb` | Switch to other buffer |
| `<Space>,` | Buffer picker |

### Tabs

| Key | Action |
|---|---|
| `<Space><tab>]` | Next tab |
| `<Space><tab>[` | Previous tab |
| `<Space><tab>l` | Last tab |
| `<Space><tab>f` | First tab |
| `<Space><tab>o` | Close other tabs |
| `<Space><tab>d` | Close tab |
| `<Space><tab><tab>` | New tab |
| `gt` / `gT` | Next / prev tab (built-in) |

### Windows

| Key | Action |
|---|---|
| `<C-h>` | Move to left window |
| `<C-l>` | Move to right window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-w>w` | Cycle windows |
| `<Space>-` | Split window below |
| `<Space>\|` | Split window right |
| `<Space>wd` | Delete window |
| `<Space>wm` | Toggle zoom |

`<C-h>` is free in Neovim because the Zellij `Ctrl h` bindings were removed
from `~/.config/zellij/config.kdl`.

### LSP

| Key | Action |
|---|---|
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gr` | References |
| `gy` | Goto type definition |
| `gI` | Goto implementation |
| `K` | Hover |
| `gK` | Signature help |
| `<Space>ca` | Code action |
| `<Space>cr` | Rename |
| `]]` / `[[` | Next / prev reference |

### Search / Picker (Snacks)

| Key | Action |
|---|---|
| `<Space><space>` | Find files (root dir) |
| `<Space>/` | Grep (root dir) |
| `<Space>ff` | Find files |
| `<Space>fg` | Find files (git) |
| `<Space>fb` | Buffers |
| `<Space>fr` | Recent |
| `<Space>fp` | Projects |
| `<Space>fc` | Find config file |

### Diagnostics

| Key | Action |
|---|---|
| `<Space>xx` | Diagnostics (Trouble) |
| `<Space>xX` | Buffer diagnostics |
| `]d` / `[d` | Next / prev diagnostic |
| `]e` / `[e` | Next / prev error |
| `]w` / `[w` | Next / prev warning |

### Git

| Key | Action |
|---|---|
| `<Space>gb` | Git blame line |
| `<Space>gl` | Git log |
| `<Space>gL` | Git log (cwd) |
| `<Space>gd` | Git diff (hunks) |
| `<Space>gD` | Git diff (origin) |
| `<Space>gs` | Git status |

### UI Toggles

| Key | Action |
|---|---|
| `<Space>us` | Toggle spelling |
| `<Space>uw` | Toggle wrap |
| `<Space>ul` | Toggle line numbers |
| `<Space>uL` | Toggle relative number |
| `<Space>ud` | Toggle diagnostics |
| `<Space>uh` | Toggle inlay hints |
| `<Space>ug` | Toggle indent guides |
| `<Space>uz` | Toggle zen mode |
| `<Space>uA` | Toggle tabline |

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
