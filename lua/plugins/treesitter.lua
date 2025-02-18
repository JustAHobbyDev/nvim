local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = false,
      ensure_installed = {
        "c",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "ocaml",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "html"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

return M
