-- return {
--   "famiu/bufdelete.nvim",
--   -- dependencies = { "nvim-tree/nvim-web-devicons" },
--   -- version = "*",
--   -- opts = {
--   --   options = {
--   --     -- mode = "tabs",
--   --     mode = "buffers",
--   --     -- separator_style = "slant",
--   --   },
--   -- },
local M = {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  -- keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
  -- keymap("n", "Q", "<cmd>bdelete!<CR>", opts)
  -- keymap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
end

return M
