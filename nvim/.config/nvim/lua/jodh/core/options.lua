vim.cmd("let g:netrw_liststyle = 3")

-- autosave
local autosave_enabled = false

function ToggleAutosave()
  if autosave_enabled then
    vim.api.nvim_del_augroup_by_name("AutosaveGroup")
    print("Autosave OFF")
  else
    local group = vim.api.nvim_create_augroup("AutosaveGroup", { clear = true })
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
      pattern = { "*" },
      command = "silent! wall",
      nested = true,
      group = group,
    })
    print("Autosave ON")
  end
  autosave_enabled = not autosave_enabled
end

local opt = vim.opt -- for conciseness

opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.laststatus = 2
opt.scrolloff = 999
opt.sidescrolloff = 9

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width (autoindent)
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
