return {
  "folke/noice.nvim",
  -- event = "VeryLazy",
  opts = {
    -- add any options here
    scrollbar = false,
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      views = {
        cmdline_popup = {
          position = {
            row = "33%", -- or a number like 40
            col = "50%", -- or a number like 0 or 10
          },
          -- size = {
          --   width = 60,
          --   height = "auto",
          -- },
          -- Example: Disable scrollbar in the command line popup
          border = {
            style = "double",
          },
          scrollbar = false,
        },
        popupmenu = {
          -- Example: Disable scrollbar in the popup menu
          -- backend = "cmp", -- if using nvim-cmp, for instance
          scrollbar = false,
        },
        messages = {
          -- enabled = false,
          scrollbar = false,
        },
      },
    })
  end,
}
