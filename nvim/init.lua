--require("jodh.lazy")

-- Enable system clipboard integration
--vim.o.clipboard = 'unnamedplus'

vim.opt.clipboard:append('unnamedplus')

-- Map Ctrl+C in visual mode to copy selected text to the system clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
