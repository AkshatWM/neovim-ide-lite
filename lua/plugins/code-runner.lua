local is_windows = vim.fn.has("win32") == 1

local function build(compiler, std)
  if is_windows then
    return string.format(
      "cd /d $dir && %s -std=%s -Wall -Wextra -g $fileName -o $fileNameWithoutExt.exe && $fileNameWithoutExt.exe",
      compiler,
      std
    )
  end

  return string.format(
    "cd $dir && %s -std=%s -Wall -Wextra -g $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    compiler,
    std
  )
end

local function rust()
  if is_windows then
    return "cd /d $dir && rustc $fileName -o $fileNameWithoutExt.exe && $fileNameWithoutExt.exe"
  end

  return "cd $dir && rustc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt"
end

return {
  "CRAG666/code_runner.nvim",
  cmd = { "RunCode", "RunClose" },
  opts = {
    mode = "term",
    focus = true,
    startinsert = true,
    term = {
      position = "bot",
      size = 12,
    },
    filetype = {
      c = build("gcc", "c17"),
      cpp = build("g++", "c++20"),
      rust = rust(),
      python = "python -u $file",
      javascript = "node $file",
    },
  },
}
