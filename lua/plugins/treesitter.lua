return {
  {
    "nvim-treesitter/nvim-treesitter",
    command = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "lua",
        "c_sharp",
      },
      -- query_linter = {
      --   enable = true,
      --   use_virtual_text = true,
      --   lint_events = { "BufWrite", "CursorHold" },
      -- },
      highlight = {
        enable = true,
      },
    },
  },
}
