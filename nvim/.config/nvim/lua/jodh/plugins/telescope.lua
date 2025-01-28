return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "folke/todo-comments.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup({
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- auto_quoting = false, --false means auto quote
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-f>"] = lga_actions.quote_prompt(),
              -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<leader>f"] = function(prompt_bufnr) --find full string - not regex
                local current_prompt = vim.api.nvim_buf_get_lines(prompt_bufnr, 0, -1, false)[1] -- Get the current input in the prompt
                local additional_text = " -F" -- Define the additional text to append
                vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { current_prompt .. additional_text }) -- Append the additional text to the current prompt
              end,
              ["<leader>w"] = function(prompt_bufnr) --find whole word only
                local current_prompt = vim.api.nvim_buf_get_lines(prompt_bufnr, 0, -1, false)[1]
                local additional_text = " -w"
                vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { current_prompt .. additional_text })
              end,
              ["<leader>i"] = function(prompt_bufnr) --find in specifci files/folders
                local current_prompt = vim.api.nvim_buf_get_lines(prompt_bufnr, 0, -1, false)[1]
                local additional_text = " --iglob"
                vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { current_prompt .. additional_text })
              end,
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
      pickers = {
        find_files = {
          -- theme = "ivy",
        },
      },
      defaults = {
        -- scroll_strategy = "limit",
        file_ignore_patterns = { "node_modules", ".git" },
        vimgrep_arguments = {
          "rg",
          "--column",
          "--smart-case",
          "--hidden",
        },
        path_display = {
          -- filename_first = {
          --   reverse_directories = true,
          -- },
          -- "smart",
        },
        mappings = {
          n = {
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["dd"] = require("telescope.actions").delete_buffer,
            ["q"] = require("telescope.actions").close,
          },
          i = {
            ["<C-space>"] = actions.to_fuzzy_refine,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<CR>"] = actions.select_default,
            ["<C-o>"] = actions.select_tab,
            ["<C-h>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-s>"] = actions.toggle_all,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            -- ["<C-s>"] = actions.select_all,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "help files" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "find buffers" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "find keymaps" })
    -- keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "help files" })
    keymap.set("n", "<leader>fs", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

    -- keymap.set("n", "<leader>fs", function()
    --   require("telescope.builtin").live_grep({
    --     additional_args = { "--column", "--smart-case", "--hidden" },
    --   })
    -- end, { desc = "Fuzzy find with live grep (including hidden files)" })

    -- keymap.set("n", "<leader>fw", function()
    --   require("telescope.builtin").live_grep({
    --     additional_args = { "-w" },
    --   })
    -- end, { desc = "Fuzzy find with live grep whole word (including hidden files)" })

    keymap.set(
      "n",
      "<leader>ff",
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden'}})<cr>",
      { desc = "fuzzy find dotfiles" }
    )
  end,
}
