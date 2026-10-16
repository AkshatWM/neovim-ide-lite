# Neovim IDE Lite

A lightweight, fast Neovim configuration built with lazy.nvim.
Focused on a VS Code-like editing experience with file exploration, fuzzy finding, live grep, and completion.

## Features

- File explorer with nvim-tree
- Fuzzy file finder with fzf-lua
- Live grep powered by ripgrep
- Completion with blink.cmp
- Status line with lualine
- Buffer tabs with bufferline
- Auto pairs
- Emmet LSP for HTML/CSS/JS/TS
- Which-key hints for discoverable keybindings
- Formatting via stylua (.stylua.toml)

## Dependencies

Required

- Neovim 0.11+ (tested on 0.12.5)
- Git
- A Nerd Font (recommended for icons)

For fuzzy finding and live grep

- fzf
- ripgrep (rg)

Optional for Mason tool installs

- unzip
- gzip
- wget
- 7z

## Installation

Linux / macOS

```sh
git clone https://github.com/AkshatWM/neovim-ide-lite.git ~/.config/nvim
```

Windows (PowerShell)

```powershell
git clone https://github.com/AkshatWM/neovim-ide-lite.git $env:LOCALAPPDATA\nvim
```

Then start Neovim.

```sh
nvim
```

Lazy.nvim will bootstrap itself and install plugins on first launch.

## Keybindings

Leader key: Space

### General

| Key | Action |
| --- | --- |
| Space | Leader key |
| Ctrl-s | Save file |
| Tab (visual) | Indent selection |
| Shift-Tab (visual) | Outdent selection |

### File Explorer

| Key | Action |
| --- | --- |
| Leader e | Toggle file explorer |
| Leader o | Reveal current file |

### Fuzzy Finding

| Key | Action |
| --- | --- |
| Ctrl-p | Find files |
| Leader fg | Live grep text in project |
| Leader fc | Browse Neovim config files |

## Notes

- Tab and Shift+Tab keep the visual selection while indenting.
- blink.cmp uses the super-tab keymap preset.
- Leader and local leader are set to Space.
- Emmet LSP is enabled for html, css, javascript, typescript, and React filetypes.
- mason.nvim is included for managing additional LSP servers and tools.

## Structure

- init.lua
- lazy-lock.json
- lua/config/keymaps.lua
- lua/config/lazy.lua
- lua/config/lsp.lua
- lua/config/options.lua
- lua/plugins/blink.lua
- lua/plugins/bufferline.lua
- lua/plugins/colorschemes.lua
- lua/plugins/fzf-lua.lua
- lua/plugins/indent-blackline.lua
- lua/plugins/lualine.lua
- lua/plugins/mason.lua
- lua/plugins/nvim-autopairs.lua
- lua/plugins/nvim-tree.lua
- lua/plugins/which-key.lua
- .stylua.toml
- LICENSE

## License

MIT License. See LICENSE.
