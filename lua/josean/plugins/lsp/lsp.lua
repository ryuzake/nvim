return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/SchemaStore.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- الدالة الجديدة المتوافقة مع تحديثات lspconfig الحديثة
    local function setup_server(name, config)
      config = config or {}
      config.capabilities = capabilities

      vim.lsp.config(name, config)
      -- تفعيل السيرفر للعمل
      vim.lsp.enable(name)
    end

    setup_server("ruff", {
      on_attach = function(client, bufnr)
        -- تفعيل التنسيق عند الحفظ إذا كنت تستخدم LSP لعمل Format
        --if client.name == "ruff" then
        -- تعطيل الـ Hover عشان ما يضاربش مع Pyright
        --client.server_capabilities.hoverProvider = false
        --end
      end,
    })
    -- 2. GitHub Actions (gh_actions_ls)
    setup_server("gh_actions_ls", {
      filetypes = { "yaml.github" },
    })

    -- 3. إعداد YAML مع SchemaStore
    setup_server("yamlls", {
      settings = {
        yaml = {
          schemaStore = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
          schemas = vim.tbl_deep_extend("force", require("schemastore").yaml.schemas(), {
            ["kubernetes"] = "*.yaml",
          }),
          validate = true,
          completion = true,
          hover = true,
        },
      },
    })

    -- 4. إعداد خادم لغة Lua
    setup_server("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- 6. إعداد خادم لغة Rust
    setup_server("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = true, -- عشان يطلع لك نصائح تحسين الكود
          diagnostics = { enable = true },
        },
      },
    })
    -- 5. باقي سيرفرات الـ DevOps
    local servers = { "dockerls", "docker_compose_language_service", "ansiblels", "terraformls" }
    for _, server in ipairs(servers) do
      setup_server(server)
    end
  end,
}
