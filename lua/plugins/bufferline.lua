return {
  "akinsho/bufferline.nvim",
  version = "*",
  opts = {
    options = {
      -- Pushes the tab bar to the right when your nvim-tree sidebar is open
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
}
