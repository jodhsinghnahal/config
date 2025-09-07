return {
  {
    "fpeterek/nvim-surfers",
    config = function()
      require("nvim-surfers").setup({
        use_tmux = false,
      })
    end,
  },
}
