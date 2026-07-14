return {
  {
    "topaxi/pipeline.nvim",
    -- This ensures the native YAML parser is compiled
    build = "make",
    keys = {
      { "<leader>ci", "<cmd>Pipeline<cr>", desc = "Open pipeline.nvim" },
    },
    ---@type pipeline.Config
    opts = {
      -- YOUR CONFIG GOES HERE
      browser = nil,
      refresh_interval = 10,
      indent = 2,
      providers = {
        github = {
          default_host = "github.com",
          resolve_host = function(host)
            return host
          end,
        },
        gitlab = {
          default_host = "gitlab.com",
          resolve_host = function(host)
            return host
          end,
        },
      },
      allowed_hosts = {},
      dispatch_branch = "default",
      icons = {
        workflow_dispatch = "⚡️",
        conclusion = {
          success = "✓",
          failure = "X",
          startup_failure = "X",
          cancelled = "⊘",
          skipped = "◌",
        },
        status = {
          unknown = "?",
          pending = "○",
          queued = "○",
          requested = "○",
          waiting = "○",
          in_progress = "●",
        },
      },
      highlights = {
        PipelineError = { link = "DiagnosticError" },
        PipelineRunIconSuccess = { link = "DiagnosticOk" },
        PipelineRunIconFailure = { link = "DiagnosticError" },
        PipelineRunIconStartup_failure = { link = "DiagnosticError" },
        PipelineRunIconPending = { link = "DiagnosticWarn" },
        PipelineRunIconRequested = { link = "DiagnosticWarn" },
        PipelineRunIconWaiting = { link = "DiagnosticWarn" },
        PipelineRunIconIn_progress = { link = "DiagnosticWarn" },
        PipelineRunIconCancelled = { link = "Comment" },
        PipelineRunIconSkipped = { link = "Comment" },
        PipelineRunCancelled = { link = "Comment" },
        PipelineRunSkipped = { link = "Comment" },
        PipelineJobCancelled = { link = "Comment" },
        PipelineJobSkipped = { link = "Comment" },
        PipelineStepCancelled = { link = "Comment" },
        PipelineStepSkipped = { link = "Comment" },
      },
      split = {
        relative = "editor",
        position = "right",
        size = 60,
        win_options = {
          wrap = false,
          number = false,
          foldlevel = nil,
          foldcolumn = "0",
          cursorcolumn = false,
          signcolumn = "no",
        },
      },
    },
  },
}
