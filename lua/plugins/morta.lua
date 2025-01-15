local opts = {}

return {
  "philosofonusus/morta.nvim",
  priority = 1000,
  opts = opts,
  defaults = {
    transparent_background = true,
  },
  config = function ()
    vim.cmd.colorscheme 'morta'
  end,
}
