return {
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  --   -- enabled = false,
  --   -- keys = {
  --   -- { "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
  --   -- { "<leader>ci", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
  --   -- {"<leader>cf", "<cmd>TSToolsFixCurrent<cr>", desc = "Fix Current"},
  --   -- {"<leader>ca", "<cmd>TSToolsFixAll<cr>", desc = "Fix All"},
  --   -- {"<leader>cc", "<cmd>TSToolsChangeConfig<cr>", desc = "Change Config"},
  --   -- },
  -- },
  {
    "dmmulroy/tsc.nvim",
    opts = {
      auto_start_watch_mode = false,
      use_trouble_qflist = false,
      flags = {
        watch = false,
      },
    },
    -- keys = {
    --   { "<leader>cttc", ft = { "typescript", "typescriptreact" }, "<cmd>TSC<cr>", desc = "Type Check" },
    --   { "<leader>cttq", ft = { "typescript", "typescriptreact" }, "<cmd>TSCOpen<cr>", desc = "Type Check Quickfix" },
    -- },
    -- ft = {
    --   "typescript",
    --   "typescriptreact",
    -- },
    -- cmd = {
    --   "TSC",
    --   "TSCOpen",
    --   "TSCClose",
    -- },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
}
