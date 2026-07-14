-- The Pull Request & Issue Manager
return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  opts = {
    enable_builtin = true,
    default_merge_method = "squash", -- Best practice for DevOps/Infra
    picker = "telescope",
  },
  keys = {
    { "<leader>op", "<cmd>Octo pr list<cr>", desc = "Octo: List PRs" },
    { "<leader>os", "<cmd>Octo search<cr>", desc = "Octo: Search GitHub" },
  },
}
