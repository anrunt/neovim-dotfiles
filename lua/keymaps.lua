-- deleting buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

-- clear copilot suggestion
vim.keymap.set({'n', 'v', 'i'}, '<C-c>', '<Esc>', { noremap = true })

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

-- LspRestart
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>")

-- Toggle word wrap
vim.keymap.set("n", "<leader>k", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap
  vim.wo.breakindent = vim.wo.wrap
end, { desc = "Toggle word wrap" })

--Splits
vim.keymap.set("n", "<leader>vs", ":vs<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>cs", ":close<CR>", { silent = true })
vim.keymap.set('n', '<space>w', '<C-w>w', { silent = true })

-- Resize splits
vim.keymap.set("n", "<leader><Left>", ":vertical resize -5<CR>", { noremap = true, silent = true, desc = "Decrease split width" })
vim.keymap.set("n", "<leader><Right>", ":vertical resize +5<CR>", { noremap = true, silent = true, desc = "Increase split width" })
vim.keymap.set("n", "<leader><Up>", ":resize +5<CR>", { noremap = true, silent = true, desc = "Increase split height" })
vim.keymap.set("n", "<leader><Down>", ":resize -5<CR>", { noremap = true, silent = true, desc = "Decrease split height" })

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

