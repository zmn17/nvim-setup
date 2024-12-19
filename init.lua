if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
require("plugins.screenshot").setup()

-- for emmet, not working
-- vim.api.nvim_set_keymap(
--   "i",
--   "<Tab>",
--   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',
--   { noremap = true, expr = true, silent = true }
-- )
