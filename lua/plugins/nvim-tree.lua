return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- load on startup so it's there immediately
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- file icons
  -- Keymaps live in lua/config/keymaps.lua to avoid duplicates
  opts = {
    view = { width = 30, side = "left" },
    renderer = { group_empty = true, indent_markers = { enable = true } },
    filters = { dotfiles = false, git_ignored = true },
    git = { enable = true },
    actions = { open_file = { quit_on_open = false } },
  },
}
