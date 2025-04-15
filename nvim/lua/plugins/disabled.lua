return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    -- enabled = false,
  },
  {

    "folke/noice.nvim",
    enabled = false,
  },
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false },
      input = { enabled = false },
      -- notifier = { enabled = false },
      -- notify = { enabled = false },
    },
  },
}
