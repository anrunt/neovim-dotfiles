return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "typescript", "svelte", "html", "css", "python", "c", "go" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
    })
  end,
}
