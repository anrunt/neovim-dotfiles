return {
  "echasnovski/mini.indentscope",
  config = function()
    require("mini.indentscope").setup({
      version = false,
      event = "BufEnter",
      symbol = "│",
      options = {
        try_as_border = true
      }
    })
  end
}
