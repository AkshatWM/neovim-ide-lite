return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto", -- borrow colors from tokyonight
      icons_enabled = true,
      section_separators = { left = "", right = "" }, -- fat arrows between groups
      component_separators = { left = "", right = "" }, -- thin arrows inside a group
      globalstatus = true, -- one bar across all splits
      disabled_filetypes = { statusline = { "lazy" } },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "filename", symbols = { modified = " ", readonly = " " } },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "lazy" },
  },
}
