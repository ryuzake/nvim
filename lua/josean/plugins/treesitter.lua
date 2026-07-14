return {
  "nvim-treesitter/nvim-treesitter",
  version = "0.9.2",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "terraform",
        "hcl",
        "python",
        "rust",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

    require("nvim-ts-autotag").setup({
      opts = {
        enable_close_on_slash = false,
        -- أضف السطر ده عشان يعطل الإضافة في المارك داون
        skip_tags = { "markdown" },
      },
    })
    -- use bash parser for zsh files
    vim.treesitter.language.register("bash", "zsh")
  end,
}
