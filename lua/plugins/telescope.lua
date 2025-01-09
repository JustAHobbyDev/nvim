-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'jonarrien/telescope-cmdline.nvim',
  },
  keys = {
    { 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
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
      cmdline = {
        -- cmdline plugin settings
      },
    },
  },
  config = function (_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension('cmdline')
  end,
}
