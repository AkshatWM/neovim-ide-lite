local map = vim.keymap.set

-- file explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })
map("n", "<leader>o", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal current file" })

-- Ctrl-S save
map({ "n", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Tab / Shift+Tab to indent highlighted blocks without losing selection
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })
