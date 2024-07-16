return {
  "dmmulroy/tsc.nvim",
  lazy = false,
  ft = {"typescript"},
  config = function()
    require("tsc").setup({
      auto_open_qflist = true,
      pretty_errors = true,
      vim.keymap.set('n', '<leader>to', ':TSCOpen<CR>'),
      vim.keymap.set('n', '<leader>tc', ':TSCClose<CR>')
    })
  end
}
