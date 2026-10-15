vim.lsp.config("emmet_language_server", {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "javascriptreact",
    "typescriptreact",
    "javascript",
    "typescript",
  },
  root_markers = { ".git", "package.json" },
})

vim.lsp.enable("emmet_language_server")
