-- lua/config/theme_selector.lua
local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local keymap = require("nui.utils.keymap")

local M = {}

M.themes = {
  "catppuccin",
  "sonokai",
  "rose-pine",
  "onedark",
  "oxocarbon",
  "nordic",
  "kanagawa-paper",
  "lackluster-hack",
  "oh-lucy",
}

local function create_theme_popup()
  local popup = Popup({
    position = {
      row = "50%",
      col = "50%",
    },
    size = {
      width = 50, -- Increase width
      height = 15, -- Increase height
    },
    enter = true,
    focusable = true,
    border = {
      style = "single",
      text = {
        top = "Select Theme",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  })

  -- Callback for when a theme is selected
  local function on_theme_select(theme)
    vim.cmd("colorscheme " .. theme)
    popup:unmount()
  end

  -- List the themes
  local lines = {}
  for i, theme in ipairs(M.themes) do
    table.insert(lines, tostring(i) .. ". " .. theme)
  end

  popup:mount()

  local bufnr = popup.bufnr
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  -- Enable cursorline to highlight the selected line
  vim.api.nvim_buf_set_option(bufnr, "cursorline", true)

  -- Map keys to navigate and select themes
  keymap.set(bufnr, "n", "<CR>", function()
    local linenr = vim.fn.line(".")
    local theme = M.themes[linenr]
    if theme then
      on_theme_select(theme)
    end
  end, { noremap = true, silent = true })

  keymap.set(bufnr, "n", "j", "gj", { noremap = true, silent = true })
  keymap.set(bufnr, "n", "k", "gk", { noremap = true, silent = true })

  -- Close the popup when it loses focus
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)
end

M.show_theme_selector = create_theme_popup

return M
