return {
  'tomasky/bookmarks.nvim',
  -- after = "telescope.nvim", deps?
  event = "VeryLazy",
  opts = {
    sign_priority = 200,
    keywords = {
      type = "table",
      ["@t"] = "✅", -- mark annotation startswith @t ,signs this icon as `Todo`
      ["@w"] = "⚠️", -- mark annotation startswith @w ,signs this icon as `Warn
      ["@f"] = "🔧", -- mark annotation startswith @f ,signs this icon as `Fix`
      ["@n"] = "📝", -- mark annotation startswith @n ,signs this icon as `Note`
      ["@p"] = "📌", -- signs this icon as `Pin`
      save_file = vim.fn.expand "$XDG_DATA_DIR/nvim.bookmarks",
    },
  },
  keys = {
    {
      "<leader>fm",
      function()
        require("telescope").extensions.bookmarks.list({})
      end,
      desc = "Search Bookmarks",
    },
    {
      "mm",
      function()
        require("bookmarks").bookmark_toggle()
      end,
      desc = "add or remove bookmark at current line"
    },
    {
      "mi",
      function()
        require("bookmarks").bookmark_ann()
      end,
      desc = "add or edit mark annotation at current line"
    },
    {
      "mc",
      function()
        require("bookmarks").bookmark_clean()
      end,
      desc = "clean all marks in local buffer"
    },
    {
      "mn",
      function()
        require("bookmarks").bookmark_next()
      end,
      desc = "jump to next mark in local buffer"
    },
    {
      "mp",
      function()
        require("bookmarks").bookmark_prev()
      end,
      desc = "jump to previous mark in local buffer"
    },
    {
      "ml",
      function()
        require("bookmarks").bookmark_list()
      end,
      desc = "show marked file list in quickfix window"
    },
    {
      "mx",
      function()
        require("bookmarks").bookmark_clear_all()
      end,
      desc = "removes all bookmarks"
    },
  },
}
