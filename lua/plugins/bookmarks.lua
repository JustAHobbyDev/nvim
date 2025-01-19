return {
  'tomasky/bookmarks.nvim',
  opts = {
    save_file = vim.fn.expand "$XDG_DATA_DIR/nvim.bookmarks",
  event = "VimEnter",
  },
  -- after = "telescope.nvim",
}
