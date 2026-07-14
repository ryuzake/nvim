--return {
--"folke/tokyonight.nvim",
--priority = 1000,
-- config = function()
--local transparent = true -- set to true if you would like to enable transparency

--  local bg = "#011628"
--  local bg_dark = "#011423"
--  local bg_highlight = "#143652"
--  --local bg_search = "#0A64AC"
--  --local bg_visual = "#275378"
--  --local fg = "#CBE0F0"
--  --local fg_dark = "#B4D0E9"
--  --local fg_gutter = "#627E97"
--  --local border = "#547998"

--require("tokyonight").setup({
--  style = "night",
--  transparent = transparent,
--  styles = {
--    sidebars = transparent and "transparent" or "dark",
--    floats = transparent and "transparent" or "dark",
--  },
--    on_colors = function(colors)
--      colors.bg = bg
--      colors.bg_dark = transparent and colors.none or bg_dark
--      colors.bg_float = transparent and colors.none or bg_dark
--      colors.bg_highlight = bg_highlight
--      colors.bg_popup = bg_dark
--      --colors.bg_search = bg_search
--      colors.bg_sidebar = transparent and colors.none or bg_dark
--      --colors.bg_statusline = transparent and colors.none or bg_dark
--      --colors.bg_visual = bg_visual
--      --colors.border = border
--      --colors.fg = fg
--      --colors.fg_dark = fg_dark
--      --colors.fg_float = fg
--      --colors.fg_gutter = fg_gutter
--      --colors.fg_sidebar = fg_dark
--    end,
-- })

--  vim.cmd("colorscheme tokyonight")
--end,
--}

--tokyonight
return {
  --"folke/tokyonight.nvim",
  --priority = 1000,
  --config = function()
  --  local transparent = true

  --  require("tokyonight").setup({
  --    style = "night",
  --    transparent = transparent,
  --    --styles = {
  --    --  sidebars = transparent and "transparent" or "dark",
  --    --  floats = transparent and "transparent" or "dark",
  --    --},
  --    on_colors = function(colors)
  --      -- Keep your custom backgrounds
  --      --colors.bg = "#011628"
  --      --colors.bg_dark = "#011423"
  --      --colors.bg_highlight = "#143652"
  --      -- REMOVED: colors.fg = fg
  --      -- Removing the 'fg' overrides lets the theme use its full palette

  --  vim.cmd("colorscheme tokyonight")
  --end,
  --}

  -- onedark
  --"navarasu/onedark.nvim",
  --priority = 1000, -- make sure to load this before all the other start plugins
  --config = function()
  --  require("onedark").setup({
  --    style = "deep",
  --  })
  --  require("onedark").load()

  -- tokyodark
  "tiagovla/tokyodark.nvim",
  --opts = {
  --  -- custom options here
  --},
  config = function(_, opts)
    require("tokyodark").setup() -- calling setup is optional
    vim.cmd([[colorscheme tokyodark]])

    if vim.g.neovide then
      vim.g.neovide_opacity = 0.65

      -- سطر اختياري لمنع تداخل الشفافية مع البلور (لو حابب تأثير blur ورا الشباك)
      vim.g.neovide_window_blurred = true
      vim.g.neovide_normal_opacity = 0.65
      vim.g.neovide_refresh_rate = 144
      vim.g.neovide_fullscreen = true

      -- إجبار النيوفيم على جعل الخلفية شفافة تماماً ليظهر تأثير Neovide
      vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
    end
    -- catppuccin
    --"catppuccin/nvim",
    --name = "catppuccin",
    --priority = 1000,
    --config = function()
    --  require("catppuccin").setup({
    --    flavour = "mocha", -- latte, frappe, macchiato, mocha
    --    transparent_background = true,
    --    integrations = {
    --      treesitter = true,
    --      native_lsp = { enabled = true },
    --    },
    --  })
    --  vim.cmd.colorscheme("catppuccin")
  end,
}
