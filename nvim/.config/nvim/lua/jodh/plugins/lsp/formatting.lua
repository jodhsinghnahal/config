return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "SConstruct", "SConscript", "*.scons" },
      callback = function()
        vim.bo.filetype = "python"
      end,
    })

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        bash = { "beautysh" },
        zsh = { "beautysh" },
        cmake = { "cmake_format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    --   conform.format({
    --     lsp_fallback = true,
    --     async = false,
    --     timeout_ms = 1000,
    --   })
    -- end, { desc = "Format file or range (in visual mode)" })
  end,
}
