return {
  "CRAG666/code_runner.nvim",
  opts = {
    mode = "term",
    focus = true,
    startinsert = true,
    term = {
      position = "bot",
      size = 12,
    },
    filetype = {
      -- Uses 'cd /d' so Windows switches drives properly, compiles, and runs the .exe
      c = "cd /d $dir && gcc \"$fileName\" -o \"$fileNameWithoutExt.exe\" && \"$fileNameWithoutExt.exe\"",
      cpp = "cd /d $dir && g++ -std=c++20 \"$fileName\" -o \"$fileNameWithoutExt.exe\" && \"$fileNameWithoutExt.exe\"",
      python = "python -u \"$file\"",
      javascript = "node \"$file\"",
      rust = "cd /d $dir && rustc \"$fileName\" && \"$fileNameWithoutExt.exe\"",
    },
  },
}
