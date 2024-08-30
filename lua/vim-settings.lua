-- Tab Space
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

-- Filetype
vim.api.nvim_command('filetype plugin on')
vim.api.nvim_command('filetype on')

vim.filetype.add({
  extension = {
    mdx = "markdown",
  }
})

-- Directory
-- vim.cmd("set autochdir")

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- Leader
vim.g.mapleader = " "

-- Clear highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Line Numbers
vim.wo.relativenumber = true
vim.wo.number = true
