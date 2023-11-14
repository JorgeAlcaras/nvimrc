-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Initialize - command to compile and run C/C++ programs
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    vim.api.nvim_create_user_command("Run", function()
      vim.cmd("w")
      vim.cmd("terminal g++ % -o %:r && ./%:r && rm %:r")
      vim.cmd("startinsert")
    end, { nargs = "?" })
  end,
  pattern = { "*.c", "*.cpp" },
})

-- Command to compile and run java programs
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    vim.api.nvim_create_user_command("Run", function()
      vim.cmd("w")
      vim.cmd("terminal javac % && java %:r && rm %:r.class")
      vim.cmd("startinsert")
    end, { nargs = "?" })
  end,
  pattern = { "*.java" },
})
