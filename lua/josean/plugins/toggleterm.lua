return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-enter>]], -- الاختصار الافتراضي لفتح/إغلاق الطرفية
      direction = "float", -- جعل الطرفية عائمة بشكل افتراضي
      float_opts = {
        border = "curved", -- شكل حواف النافذة العائمة
      },
      shell = "fish",
    })
  end,
}
