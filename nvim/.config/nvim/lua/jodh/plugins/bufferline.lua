return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      -- mode = "tabs",
      -- mode = "buffers",
      -- separator_style = "slant",
      -- numbers = function(number_opts)
      --   local harpoon = require("harpoon.mark")
      --   local buf_name = vim.api.nvim_buf_get_name(number_opts.id)
      --   local harpoon_mark = harpoon.get_index_of(buf_name)
      --   return harpoon_mark
      -- end,
      numbers = function(opts)
        -- return string.format("%s", opts.id)
        -- return string.format("%s", opts.ordinal)
      end,
    },
  },
  -- require("bufferline").setup({
  --   options = {
  --     numbers = function(number_opts)
  --       local harpoon = require("harpoon.mark")
  --       local buf_name = vim.api.nvim_buf_get_name(number_opts.id)
  --       local harpoon_mark = harpoon.get_index_of(buf_name)
  --       return harpoon_mark
  --     end,
  --   },
  -- }),
}
