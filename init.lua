require("josean.core")
require("josean.lazy")
require("josean.lsp")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    os.execute("kitty @ set-spacing margin=0")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    os.execute("kitty @ set-spacing margin=20")
  end,
})
