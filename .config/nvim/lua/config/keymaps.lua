-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v", "x", "o" }, "<A-l>", function()
  LazyVim.format({ force = true })
end)

local map = vim.keymap.set
local wk = require("which-key")

-- auto indent on empty lines
local function smart_insert()
  local current_line = vim.api.nvim_get_current_line()
  local current_linenr = vim.fn.line(".")
  local last_linenr = vim.fn.line("$")
  -- local col = vim.fn.wincol();

  -- 检查是否为空行（允许空白字符）且非最后一行
  if current_line:match("^%s*$") and current_linenr ~= last_linenr then
    vim.api.nvim_feedkeys("ddO", "n", true)
  else
    vim.api.nvim_feedkeys("i", "n", true)
  end
end

vim.keymap.set("n", "i", smart_insert, {
  noremap = true,
  silent = true,
  desc = "Smart insert with auto-indent on empty lines",
})

map("n", "cc", "_C")

local cmd = function(command)
  return "<Esc><Cmd>" .. command .. "<CR>"
end
wk.add({
  { "<leader>dd", cmd([[lua require'dap'.continue()]]), desc = "Start" },
  { "<F1>", cmd([[lua require'dap'.continue()]]), desc = "Start" },
  { "<F2>", cmd([[lua require'dap'.run_to_cursor()]]), desc = "Run to cursor" },
  { "<F3>", cmd([[lua require'dap'.step_over()]]), desc = "Step Over" },
  { "<F4>", cmd([[lua require'dap'.step_into()]]), desc = "Step Into" },
  { "<F5>", cmd([[lua require'dap'.step_out()]]), desc = "Step Out" },
  { "<F6>", cmd([[lua require'dap'.run_last()]]), desc = "Run Last" },
  { "<F11>", cmd([[lua require'dap'.terminate()]]), desc = "Terminate" },
})
