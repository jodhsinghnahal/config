return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    global_settings = {
      tabline = true,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
    },
    menu = {
      width = vim.api.nvim_win_get_width(0) - 10,
    },
  },
  config = function()
    local harpoon = require("harpoon")
    local ui = require("harpoon.ui")
    harpoon:setup()

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<C-e>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>m", function()
      harpoon:list():add()
    end, { desc = "add harpoon list" })

    keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "harpoon menu" })

    -- Set <space>1..<space>5 be my shortcuts to moving to the files
    for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
      keymap.set("n", string.format("<space>%d", idx), function()
        harpoon:list():select(idx)
      end, { desc = string.format("harpoon open %d", idx) })
    end
  end,
}
