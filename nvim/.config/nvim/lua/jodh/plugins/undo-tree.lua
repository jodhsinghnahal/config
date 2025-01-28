return {
  -- Other plugins...
  {
    "mbbill/undotree",
    keys = {
      { "<Leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1 -- Focus on Undotree when toggled
    end,
  },
}
