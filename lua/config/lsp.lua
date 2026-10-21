local clangd_cmd = {
  "clangd",
  "--background-index",
  "--clang-tidy",
  "--completion-style=detailed",
  "--header-insertion=never",
  "--query-driver=**/gcc.exe,**/g++.exe",
}

local root_markers = { ".clangd", "compile_commands.json", "CMakeLists.txt", "Makefile", ".git" }

-- clangd falls back to a `clang` driver when a project has no compilation
-- database. That driver is often missing on Windows, so MinGW's include
-- directories are read from g++ and passed as fallback flags instead.
local mingw_flags_cache

local function mingw_flags()
  if mingw_flags_cache then
    return mingw_flags_cache
  end

  mingw_flags_cache = {}

  if vim.fn.has("win32") == 0 then
    return mingw_flags_cache
  end

  local compiler = vim.fn.exepath("g++")
  if compiler == "" then
    return mingw_flags_cache
  end

  local ok, result = pcall(function()
    return vim.system({ compiler, "-xc++", "-E", "-v", "-" }, { stdin = "", text = true }):wait()
  end)
  if not ok or result.code ~= 0 then
    return mingw_flags_cache
  end

  mingw_flags_cache = { "--target=x86_64-w64-windows-gnu" }
  local in_search_paths = false

  for line in (result.stderr or ""):gmatch("[^\r\n]+") do
    if line:find("search starts here", 1, true) then
      in_search_paths = true
    elseif line:find("End of search list", 1, true) then
      in_search_paths = false
    elseif in_search_paths then
      mingw_flags_cache[#mingw_flags_cache + 1] = "-isystem"
      mingw_flags_cache[#mingw_flags_cache + 1] = vim.trim(line)
    end
  end

  return mingw_flags_cache
end

local function configure(name, filetype, std)
  vim.lsp.config(name, {
    cmd = clangd_cmd,
    filetypes = { filetype },
    root_markers = root_markers,
    before_init = function(params)
      params.initializationOptions = params.initializationOptions or {}
      params.initializationOptions.fallbackFlags =
        vim.list_extend({ "-std=" .. std, "-Wall", "-Wextra" }, mingw_flags())
    end,
  })
end

configure("clangd_c", "c", "c17")
configure("clangd_cpp", "cpp", "c++20")

vim.lsp.config("basedpyright", {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        -- Ruff owns these checks and offers quick fixes for them.
        diagnosticSeverityOverrides = {
          reportUnusedImport = "none",
          reportUnusedVariable = "none",
        },
      },
    },
  },
})

-- Ruff provides formatting, linting, and import sorting for Python.
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  init_options = {
    settings = {
      lint = {
        -- basedpyright reports undefined names with better type context.
        ignore = { "F821" },
      },
    },
  },
})

vim.lsp.enable({ "clangd_c", "clangd_cpp", "basedpyright", "ruff" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, "Format buffer")
    map("n", "<leader>cd", vim.diagnostic.open_float, "Show line diagnostics")
    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, "Previous diagnostic")
    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, "Next diagnostic")
  end,
})
