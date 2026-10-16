local map = vim.keymap.set

-- file explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })
map("n", "<leader>o", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal current file" })

-- Ctrl-S save
map({ "n", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Tab / Shift+Tab to indent highlighted blocks without losing selection
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })

-- Ctrl+P to find files in current project (just like VS Code)
map("n", "<C-p>", "<cmd>FzfLua files<cr>", { desc = "Find files" })

-- Leader + fg to search text across all files (Live Grep)
-- Note: requires 'ripgrep' (rg) installed on your system
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Search text in project" })

-- Leader + fc to search specifically inside your ~/.config/nvim files from anywhere
map("n", "<leader>fc", function()
  require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search Neovim config files" })
