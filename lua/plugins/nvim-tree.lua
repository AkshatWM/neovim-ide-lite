return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = { width = 30, side = "left" },
    renderer = { group_empty = true, indent_markers = { enable = true } },
    filters = { dotfiles = false, git_ignored = true },
    git = { enable = true },
    actions = { open_file = { quit_on_open = false } },
  },
}
