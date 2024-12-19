-- Screenshot plugin for Neovim using Silicon

local M = {}

-- Function to run Silicon and capture screenshot
function M.silicon_screenshot()
  -- Get the current filetype as language for Silicon
  local filetype = vim.bo.filetype
  -- Define the output path (you can modify this to any desired path)
  local output_path = "~/Documents/Temp/Screenshots/code.png"

  -- Use the visual selection or the entire file as input
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local cmd = string.format(":'<,'>w !silicon --language %s --output %s", filetype, output_path)

  -- Execute Silicon command in Neovim
  vim.cmd(cmd)

  -- Notify the user
  print("Screenshot saved to " .. output_path)
end

-- Setup keybindings for the plugin
function M.setup()
  -- Keybinding to take screenshot of selected code
  vim.api.nvim_set_keymap(
    "v",
    "<leader>sx",
    ':lua require("plugins.screenshot").silicon_screenshot()<CR>',
    { noremap = true, silent = true }
  )
end

return M
