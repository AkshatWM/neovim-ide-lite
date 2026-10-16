# Neovim IDE Lite

A lightweight, fast Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim).  
Focused on a VS Code-like editing experience with file exploration, fuzzy finding, live grep, and completion.

## Features

- **File explorer** with `nvim-tree`
- **Fuzzy file finder** with `fzf-lua`
- **Live grep** powered by `ripgrep`
- **Completion** with `blink.cmp`
- **Status line** with `lualine`
- **Buffer tabs** with `bufferline`
- **Auto pairs**
- **Emmet LSP** for HTML/CSS/JS/TS
- **Which-key** hints for discoverable keybindings
- **Formatting** via `stylua` (see `.stylua.toml`)

## Dependencies

Required:

- Neovim `0.11+` (tested on `0.12.5`)
- Git
- A Nerd Font (recommended for icons)

For fuzzy finding and live grep:

- `fzf`
- `ripgrep` (`rg`)

Optional, for Mason tool installs:

- `unzip`, `gzip`, `wget`, `7z`

## Installation

### Linux / macOS

```sh
git clone https://github.com/AkshatWM/neovim-ide-lite.git ~/.config/nvim
```

### Windows (PowerShell)

```powershell
git clone https://github.com/AkshatWM/neovim-ide-lite.git $env:LOCALAPPDATA\nvim
```

Then start Neovim:

```sh
nvim
```

Lazy.nvim will bootstrap itself and install plugins on first launch.

## Keybindings

Leader key: `<Space>`

### General

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<C-s>` | Save file |
| `<Tab>` (visual) | Indent selection |
| `<S-Tab>` (visual) | Outdent selection |

### File Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>o` | Reveal current file |

### Fuzzy Finding

| Key | Action |
|-----|--------|
| `<C-p>` | Find files |
| `<leader>fg` | Live grep text in project |
| `<leader>fc` | Browse Neovim config files |

## Notes

- `Tab` and Shift+Tab are configured to keep your visual selection while indenting.
- `blink.cmp` uses the `super-tab` keymap preset.
- `vim.g.mapleader` and `vim.g.maplocalleader` are set to `<Space>`.
- Emmet LSP is enabled for `html`, `css`, `javascript`, `typescript`, and React filetypes.
- `mason.nvim` is included for managing additional LSP servers and tools.

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
└── .stylua.toml
```

## License

No license specified yet.
```<|end|><|start|>write to=assistant<|channel|>analysis<|message|>We included a false "Editor j/k Normal motion" odd. Could remove. Need trim inaccurate. Also "Cursor jump top/bottom" maybe unnecessary filler. Better remove that block to avoid nonsense. Let's edit README remove those two lines. Use edit.<|end|><|start|> fileList <|constrain|>xml<|message|><rfl:parameter name="path">
C:\Users\aksha\AppData\Local\nvim\README.md