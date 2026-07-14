return {
  "benomahony/uv.nvim",
  -- Optional filetype to lazy load when you open a python file
  ft = { "python", "py" },
  -- Optional dependency, but recommended:
  dependencies = {
    -- "folke/snacks.nvim",
    -- or
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    picker_integration = true,
    keymaps = {
      prefix = "<leader>u", -- هكذا سيتم تفعيل الاختصار بنجاح
    },
  },
  execution = {
    -- Python run command template
    run_command = "uv run",
  },
}
