return {
  "mgierada/lazydocker.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  config = function()
    require("lazydocker").setup({
      border = "curved", -- Options: "single" | "double" | "shadow" | "curved"
      width = 0.9, -- 90% of editor width
      height = 0.9, -- 90% of editor height
    })
  end,
  event = "VeryLazy",
  keys = {
    { "<leader>ld", "<cmd>Lazydocker<cr>", desc = "Open Lazydocker" },
  },
}
