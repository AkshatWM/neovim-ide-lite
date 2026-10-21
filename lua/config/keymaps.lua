local map = vim.keymap.set

-- file explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })
map("n", "<leader>o", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal current file" })

-- Ctrl-S save
map({ "n", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Ctrl-A select the whole file (replaces the default increment-number behavior)
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Alt+Up / Alt+Down to move the current line or selection (like VS Code)
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up", silent = true })
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down", silent = true })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up", silent = true })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down", silent = true })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up", silent = true })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down", silent = true })

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

-- Save file and run code in bottom terminal (Leader + r or F5)
map("n", "<leader>r", "<cmd>w<cr><cmd>RunCode<cr>", { desc = "Save and Run Code" })
map("n", "<F5>", "<cmd>w<cr><cmd>RunCode<cr>", { desc = "Save and Run Code" })

-- Close the bottom runner panel
map("n", "<leader>rc", "<cmd>RunClose<cr>", { desc = "Close Code Runner" })

-- Press Esc inside the terminal to exit Terminal Insert mode easily
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Move between code and bottom terminal easily using Ctrl + j / k
map({ "n", "t" }, "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move up to code" })
map({ "n", "t" }, "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move down to terminal" })
