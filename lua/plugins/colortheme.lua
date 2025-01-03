return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
				sidebars = "dark",
				floats = "dark",
      }
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
--return {
--  "oxfist/night-owl.nvim",
--  lazy = false, -- make sure we load this during startup if it is your main colorscheme
--  priority = 1000, -- make sure to load this before all the other start plugins
--  config = function()
--    -- load the colorscheme here
--    require("night-owl").setup()
--    vim.cmd.colorscheme("night-owl")
--  end
--}
