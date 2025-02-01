-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for concisenss

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("c", "jk", "<C-c>", { desc = "Exit command mode with jk" })
-- keymap.set("t", "jk", "<ESC>", { desc = "Exit command mode with jk" })

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- keymap.set("n", "d", '"_d')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "force quit" }) -- decrement
-- keymap.set("n", "<leader>aq", "<cmd>qa!<CR>", { desc = "force quit all" }) -- decrement
-- keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "exit" }) -- decrement
-- keymap.set("n", "<leader>ax", "<cmd>xa<CR>", { desc = "exit all" }) -- decrement
-- keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "write" }) -- decrement
-- keymap.set("n", "<leader>aw", "<cmd>wa<CR>", { desc = "write all" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- keymap.set("n", "<leader>sq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- keymap.set("n", "<leader>sq", "<cmd>q<CR>", { desc = "Close current split" }) -- close current split window
-- keymap.set("n", "<leader>sa", "<cmd>qa<CR>", { desc = "Close current split" }) -- close current split window
-- keymap.set("n", "<leader>sx", "<cmd>x<CR>", { desc = "Save and close current split" }) -- close current split window
-- keymap.set("n", "<leader>sw", "<cmd>w<CR>", { desc = "Save current split" }) -- close current split window

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>n", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>p", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>o", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffers
-- keymap.set("n", "<s-l>", ":bfirst<enter>", { noremap = false })
-- keymap.set("n", "<s-h>", ":bprev<enter>", { noremap = false, desc = "Switch to the previous buffer" })
-- keymap.set("n", "<s-l>", ":bnext<enter>", { noremap = false, desc = "Switch to the next buffer" })

keymap.set("n", "<s-l>", ":BufferLineCycleNext<enter>", { noremap = false, desc = "Switch to the previous buffer" })
keymap.set("n", "<s-h>", ":BufferLineCyclePrev<enter>", { noremap = false, desc = "Switch to the next buffer" })

keymap.set("n", "<leader>d", ":bdelete<enter>", { noremap = false, desc = "Delete the current buffer" })
keymap.set("n", "<leader>e", ":e #<enter>", { noremap = false, desc = "Open the alternate file" })

keymap.set(
  "n",
  -- "<leader><",
  "<",
  ":BufferLineMovePrev<CR>",
  { noremap = true, silent = true, desc = "Move buffer to the left" }
)
keymap.set("n", ">", ":BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer to the right" })

-- files
-- keymap.set("n", "QQ", ":q!<enter>", { noremap = false })
-- keymap.set("n", "WW", ":w!<enter>", { noremap = false })
keymap.set({ "n", "v", "x" }, "E", "$", { noremap = false })
keymap.set("n", "W", "%", { noremap = false })
keymap.set({ "n", "v", "x" }, "<s-j>", "<c-d>", { noremap = false })
keymap.set({ "n", "v", "x" }, "<s-k>", "<c-u>", { noremap = false })
keymap.set("n", "<leader>rw", ":%s//g<Left><Left>", { desc = "Replace in file" })
keymap.set("v", "<leader>r", ":s//g<Left><Left>", { desc = "Replace in selection" })
keymap.set("v", "q", "<Esc>", { noremap = true, silent = true })

keymap.set("n", "<leader>a", "VggG", { desc = "select all" })
-- keymap.set("n", "E", "$", { noremap = false })
-- keymap.set("n", "B", "^", { noremap = false })
-- keymap.set("n", "TT", ":TransparentToggle<CR>", { noremap = true })
-- keymap.set("n", "ss", ":noh<CR>", { noremap = true })
