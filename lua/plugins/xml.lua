return {
  "othree/xml.vim",
  config = function()
    -- Additional configuration if needed
    vim.api.nvim_exec(
      [[
      autocmd BufNewFile,BufRead *.plist set filetype=xml
    ]],
      false
    )
  end,
}
