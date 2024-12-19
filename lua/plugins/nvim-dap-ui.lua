return {
  "rcarriga/nvim-dap-ui",
  config = function()
    require("dapui").setup()
    -- require("dapui").open()
    -- require("dapui").close()
    -- require("dapui").toggle()
    vim.api.nvim_set_keymap("n", "<leader>xd", ':lua require("dap").run()<CR>', { noremap = true, silent = true })
  end,
  requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
}
