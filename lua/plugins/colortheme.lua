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
            },
        })
        vim.cmd.colorscheme("tokyonight-night")
    end,
}

--return {
--  "vague2k/vague.nvim",
--  config = function()
--    require("vague").setup()
--    vim.cmd.colorscheme("vague")
--  end
--}

--return {
--    "rose-pine/neovim",
--    name = "rose-pine",
--    config = function()
--        vim.cmd("colorscheme rose-pine")
--    end,
--}
