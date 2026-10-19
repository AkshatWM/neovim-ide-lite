-- Inside lsp.lua
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--query-driver=**/*g++.exe",
    "--fallback-style=llvm",
  },
  filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "compile_commands.json", ".git" },
  init_options = {
    fallbackFlags = { "-std=c++20", "-Wall", "-Wextra" },
  },
})

vim.lsp.enable("clangd")
