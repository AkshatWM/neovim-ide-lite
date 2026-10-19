# Neovim IDE Lite

A lightweight, fast Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim), focused on a VS Code-like workflow: file tree, fuzzy finding, live grep, completion, and first-class C/C++ tooling without the bulk.

## Features

- File explorer with `nvim-tree`
- Fuzzy file finder with `fzf-lua`
- Project-wide live grep powered by `ripgrep`
- Snippet-aware autocompletion with `blink.cmp`
- LSP via Neovim's built-in client (`vim.lsp.config` / `vim.lsp.enable`)
- `clangd` for C and C++, with per-language standards (`C17` / `C++20`)
- Inline diagnostics, hover docs, rename, code actions, and formatting
- Save-and-run runner for C, C++, Rust, Python, and JavaScript
- Clean status line via `lualine`
- Bufferline tab bar with `nvim-tree` offset support
- Auto pairs
- Which-key hints for discoverable mappings
- Consistent Lua formatting through `stylua`

## Dependencies

Required

- Neovim 0.11+ (tested on 0.12.6)
- Git
- A Nerd Font for icons

Finder and grep

- fzf
- ripgrep (`rg`)

C / C++

- `gcc` and `g++` on `PATH` (MinGW-w64 on Windows)
- `clangd` (install it once with `:Mason`, or provide it on `PATH`)
- `gdb` (optional, for debugging outside Neovim)

Other languages (only needed if you run those files)

- `rustc` for Rust
- `python` for Python
- `node` for JavaScript

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

Launch `nvim`; lazy.nvim will bootstrap and install plugins on first run. Then open `:Mason` and install `clangd` if it is not already available.

## Keybindings

Leader key: `Space`

### General

| Key                  | Action             |
| -------------------- | ------------------ |
| `Space`              | Leader key         |
| `Ctrl-s`             | Save file          |
| `Tab` (Visual)       | Indent selection   |
| `Shift-Tab` (Visual) | Outdent selection  |

### File Explorer

| Key        | Action               |
| ---------- | -------------------- |
| `Leader e` | Toggle file explorer |
| `Leader o` | Reveal current file  |

### Fuzzy Finding

| Key         | Action                     |
| ----------- | -------------------------- |
| `Ctrl-p`    | Find files                 |
| `Leader fg` | Live grep text in project  |
| `Leader fc` | Browse Neovim config files |

### Running Code

| Key              | Action                                |
| ---------------- | ------------------------------------- |
| `Leader r`       | Save and run current file             |
| `F5`             | Save and run current file             |
| `Leader rc`      | Close the runner panel                |
| `Esc` (Terminal) | Leave terminal mode                   |
| `Ctrl-k`         | Move from the runner up to the code   |
| `Ctrl-j`         | Move from the code down to the runner |

### C / C++ (LSP)

| Key          | Action                                   |
| ------------ | ---------------------------------------- |
| `gd`         | Go to definition                         |
| `gD`         | Go to declaration                        |
| `grn`        | Rename symbol (built-in default)         |
| `gra`        | Code action (built-in default)           |
| `grr`        | Find references (built-in default)       |
| `gri`        | Go to implementation (built-in default)  |
| `K`          | Hover documentation (built-in default)   |
| `Leader rn`  | Rename symbol                            |
| `Leader ca`  | Code action                              |
| `Leader cf`  | Format buffer                            |
| `Leader cd`  | Show diagnostics for the current line    |
| `[d` / `]d`  | Previous / next diagnostic               |

## Notes

- `Tab` keeps the visual selection while indenting.
- `blink.cmp` uses the `super-tab` keymap preset.
- `Leader` and `LocalLeader` are both `Space`.
- Diagnostics are shown inline and sorted by severity.
- C and C++ files get `cindent`, `textwidth=100`, and a column guide at 100.
- Mason is included for installing additional tools and servers.

### C / C++ language server

`clangd` is configured twice, as `clangd_c` and `clangd_cpp`, so each language receives the correct standard: `-std=c17` for C and `-std=c++20` for C++. Only the server matching the buffer's filetype starts.

Projects with a `compile_commands.json` (for example from CMake with `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`) or a `.clangd` file get exact flags from those files. Without one, `clangd` uses fallback flags. On Windows those fallback flags also include the MinGW system include directories, read from `g++` at the moment the server starts, so `<stdio.h>` and `<iostream>` resolve out of the box.

Formatting is handled by `clangd` itself, so no separate `clang-format` binary is required.

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
│       ├── code-runner.lua
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
