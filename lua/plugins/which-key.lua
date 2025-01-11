return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- configuration goes here
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
