return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      routes = {
        {
          event = {
            "notify", "msg_show"
          },
          filter = {
            find = "No information available",
          },
          opts = { skip = true },
        },
        {
          event = {
            "notify", "msg_show"
          },
          filter = {
            find = "written",
          },
          opts = { skip = true },
        },
      },
    })
  end,
}
