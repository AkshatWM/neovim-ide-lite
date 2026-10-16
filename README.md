# Neovim IDE Lite

A lightweight, fast Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim), focused on a VS Code-like workflow: file tree, fuzzy finding, live grep, and completion without heavy bulk.

## Features

- File explorer with `nvim-tree`
- Fuzzy file finder with `fzf-lua`
- Project-wide live grep powered by `ripgrep`
- Snippet-aware autocompletion with `blink.cmp`
- Clean status line via `lualine`
- Bufferline tab bar with `nvim-tree` offset support
- Auto pairs
- Emmet LSP for HTML, CSS, JS, TS, and React filetypes
- Which-key hints for discoverable mappings
- Consistent formatting through `stylua`

## Dependencies

Required

- Neovim 0.11+ (tested on 0.12.5)
- Git
- A Nerd Font for icons

Finder and grep

- fzf
- ripgrep (`rg`)

Optional tools for Mason installs

- unzip, gzip
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

Launch `nvim`; lazy.nvim will bootstrap and install plugins on first run.

## Keybindings

Leader key: `Space`

### General

| Key           | Action                  |
| ------------- | ----------------------- |
| `Space`       | Leader key              |
| `Ctrl-s`      | Save file               |
| `Tab` Visual  | Indent selection        |
| `Shift-Tab` Visual | Outdent selection   |

### File Explorer

| Key          | Action               |
| ------------ | -------------------- |
| `Leader e`   | Toggle file explorer |
| `Leader o`   | Reveal current file  |

### Fuzzy Finding

| Key          | Action                         |
| ------------ | ------------------------------ |
| `Ctrl-p`     | Find files                     |
| `Leader fg`  | Live grep text in project      |
| `Leader fc`  | Browse Neovim config files     |

## Notes

- `Tab` keeps the visual selection while indenting.
- `blink.cmp` uses the `super-tab` keymap preset.
- `Leader` and `LocalLeader` are both `Space`.
- Emmet is configured for HTML, CSS, JS, TS, and React filetypes.
- Mason is included for installing additional tools and servers.

## Structure

```text
.
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── config/
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   ├── lsp.lua
│   │   └── options.lua
│   └── plugins/
│       ├── blink.lua
│       ├── bufferline.lua
│       ├── colorschemes.lua
│       ├── fzf-lua.lua
│       ├── indent-blackline.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── nvim-autopairs.lua
│       ├── nvim-tree.lua
│       └── which-key.lua
├── .stylua.toml
└── LICENSE
```

## License

MIT License. See [LICENSE](LICENSE).
```