return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  ft = "python",
  cmd = "VenvSelect",
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python virtual environment" },
  },
  opts = {
    options = {
      picker = "telescope",
      notify_user_on_venv_activation = true,
    },
  },
}
