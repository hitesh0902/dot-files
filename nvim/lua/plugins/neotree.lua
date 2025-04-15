local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts 'Up')
  -- vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
  vim.keymap.set("n", "e", "", opts("nothing"))

  local lefty = function()
    local node_at_cursor = api.tree.get_node_under_cursor()
    -- if it's a node and it's open, close
    if node_at_cursor.nodes and node_at_cursor.open then
      api.node.open.edit()
      -- else left jumps up to parent
    else
      api.node.navigate.parent()
    end
  end
  -- function for right to assign to keybindings
  local righty = function()
    local node_at_cursor = api.tree.get_node_under_cursor()
    -- if it's a closed node, open it
    if node_at_cursor.nodes and not node_at_cursor.open then
      api.node.open.edit()
    else
      api.node.open.edit()
    end
  end

  vim.keymap.set("n", "h", lefty, opts("close"))
  vim.keymap.set("n", "l", righty, opts("open"))
  vim.keymap.set("n", "<Left>", lefty, opts("close"))
  vim.keymap.set("n", "<Right>", righty, opts("open"))
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    -- opts = {
    --   window = {
    --     width = 45,
    --   },
    -- },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
        -- update_cwd = true,
      },
      renderer = {
        -- root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 45,
        side = "left",
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        desc = "NvimTree Toggle",
        { slient = true },
      },
    },
  },
}
