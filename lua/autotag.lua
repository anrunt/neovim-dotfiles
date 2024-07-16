return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      filetypes = { "html", "svelte", "javascript" },
      enable_close = true,
      enable_rename = true,
    })
  end
}
