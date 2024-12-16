-- ysaw " : add quote around word
-- ds " : delete quote
-- cs " ' : change quote to single quote
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
