-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("n", "<leader>rn", function()
  local current_word = vim.fn.expand("<cword>")
  vim.ui.input({ prompt = "Rename to: ", default = current_word }, function(new_name)
    if new_name and new_name ~= "" then
      vim.cmd("IncRename " .. new_name)
    end
  end)
end, { desc = "Rename symbol interactively" })
