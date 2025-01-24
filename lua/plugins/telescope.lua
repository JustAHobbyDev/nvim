-- plugins/telescope.lua:
local function multiripgrep() require('config.telescope.multi-ripgrep') end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'jonarrien/telescope-cmdline.nvim',
    'tomasky/bookmarks.nvim',
  },
  keys = {
    { 'Q',                '<cmd>Telescope cmdline<cr>',    desc = 'Cmdline' },
    { '<leader><leader>', '<cmd>Telescope cmdline<cr>',    desc = 'Cmdline' },
    { '<leader>ff',       '<cmd>Telescope find_files<cr>', desc = 'Telescope find files' },
    { '<leader>fg',       multiripgrep(),                  desc = 'Telescope live grep' },
    { '<leader>fb',       '<cmd>Telescope buffers<cr>',    desc = 'Telescope buffers' },
    { '<leader>fh',       '<cmd>Telescope help_tags<cr>',  desc = 'Telescope help tags' },
    {
      '<leader>en',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath "config" }
      end,
      desc = 'Telescope find files in config directory'
    },
    {
      '<leader>ep',
      function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end
    },
  },
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      selection_strategy = "follow",
      layout_strategy = "horizontal",
      layout_config = {
        -- width = 0.95
      },
    },
    extensions = {
      bookmarks = {},
      fzf = {},
      cmdline = {
        -- cmdline plugin settings
      },
    },
    pickers = {
      find_files = {
        theme = 'ivy',
      },
      buffers = {
        mappings = {
          n = {
            ["dd"] = require("telescope.actions").delete_buffer
          },
        },
      },
    }
  },
  -- config = function(_, opts)
  --   require("telescope").setup(opts)
  --   require('telescope').load_extension('cmdline')
  --   require('telescope').load_extension('fzf')
  --   require('telescope').load_extension('bookmarks')
  --   -- require('config.telescope.multi-ripgrep')
  -- end,
}
