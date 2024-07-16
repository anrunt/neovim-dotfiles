-- deleting buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

-- moving selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- sets cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- yanking into system copy
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- replace every word in the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Delete all buffers
---@diagnostic disable-next-line: lowercase-global -- Weird error
function delete_all_buffers()
  local buffers = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end
end

vim.api.nvim_set_keymap('n', 'cb', ':lua delete_all_buffers()<CR>', { noremap = true, silent = true })

