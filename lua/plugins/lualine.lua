return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "solarized-osaka",
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          function()
            return vim.fn.expand('%:f')
          end
        },
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    })
  end,
}
