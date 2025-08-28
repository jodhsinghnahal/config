return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- -- Disable default mappings if you want full control
    -- vim.g.VM_default_mappings = 0
    --
    -- Custom key remaps
    vim.g.VM_maps = {
      ["Find Under"] = "<C-S-n>",
      ["Find Subword Under"] = "<C-S-n>",
      ["Add Cursor Down"] = "<C-Down>",
      ["Add Cursor Up"] = "<C-Up>",
      ["Remove Region"] = "<C-x>",
      -- ["Skip Region"] = "<C-x>",
      -- ["Remove Region"] = "<C-S-p>",
    }
    -- ctrl-n, shift-q, tab
    -- yanked in register ""
  end,
}
