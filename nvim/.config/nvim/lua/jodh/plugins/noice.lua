return {
  "folke/noice.nvim",
  event = "VeryLazy",
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
          scrollbar = false,
        },
      },
    })
  end,
}
