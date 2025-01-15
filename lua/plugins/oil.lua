---@diagnostic disable: undefined-doc-name, unused-local
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
    watch_for_changes = true,
    git = {
      -- Return true to automatically git add/mv/rm files
      add = function(path)
        return false
      end,
      mv = function(src_path, dest_path)
        return false
      end,
      rm = function(path)
        return false
      end,
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
