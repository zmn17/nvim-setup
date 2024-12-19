return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.cmd("source ~/.config/nvim/coc-settings.vim")
    end,
  },
}
