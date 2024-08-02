return {
  "jiaoshijie/undotree",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = true,
  keys = {
    -- load the plugin only when using its keybindings
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "[U]ndo Tree" },
  },
}
