-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused language providers (keeps :checkhealth clean)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- nvim-tree replaces netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Faster module loading
vim.loader.enable()

-- Editing behavior
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with <<, >>, and Enter
vim.opt.tabstop = 4 -- How many spaces a Tab character displays as
vim.opt.softtabstop = 4 -- How many spaces Tab/Backspace feels like in Insert mode
vim.opt.smartindent = true -- Smart auto-indenting on new lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

-- Comfort while editing
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- Keeps diagnostics from shifting the text
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 250 -- Faster diagnostics and hover
vim.opt.undofile = true

-- Diagnostics
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  severity_sort = true,
  float = { border = "rounded", source = true },
})

-- C and C++ specifics
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.cindent = true
  end,
})

-- Python specifics (matches Ruff's default line length)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Python indentation comes from 'indentexpr', not 'smartindent'.
    vim.bo.smartindent = false
  end,
})

-- 'colorcolumn' is window-local, so it does not follow the buffer. Apply it
-- from the filetype and reset it for everything else (including the code
-- runner terminal), otherwise "88" leaks into unrelated buffers and splits.
local width_by_filetype = {
  python = 88,
  c = 100,
  cpp = 100,
}

local function apply_text_width()
  local width = width_by_filetype[vim.bo.filetype]

  if width then
    vim.bo.textwidth = width
    vim.wo.colorcolumn = tostring(width)
  else
    vim.wo.colorcolumn = ""
  end
end

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
  callback = apply_text_width,
})
