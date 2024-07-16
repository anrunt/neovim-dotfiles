return {
  "ThePrimeagen/harpoon",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')
    require('harpoon').setup({
      vim.keymap.set("n", "<leader>a", mark.add_file),
      vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu),
      -- navigation
      vim.keymap.set("n", "gt", function() ui.nav_next() end),
      vim.keymap.set("n", "gT", function() ui.nav_prev() end)
    })
  end
}
