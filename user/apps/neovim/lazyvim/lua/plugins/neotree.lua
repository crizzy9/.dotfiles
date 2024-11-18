return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        never_show = {},
      },
    },
  },
  keys = {
    { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
}
