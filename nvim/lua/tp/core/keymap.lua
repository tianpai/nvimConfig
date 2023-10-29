--
--  <-.(`-')  (`-')  _               <-. (`-')   (`-')  _  _  (`-') (`-').->
--   __( OO)  ( OO).-/     .->          \(OO )_  (OO ).-/  \-.(OO ) ( OO)_
--  '-'. ,--.(,------. ,--.'  ,-.    ,--./  ,-.) / ,---.   _.'    \(_)--\_)
--  |  .'   / |  .---'(`-')'.'  /    |   `.'   | | \ /`.\ (_...--''/    _ /
--  |      /)(|  '--. (OO \    /     |  |'.'|  | '-'|_.' ||  |_.' |\_..`--.
--  |  .   '  |  .--'  |  /   /)     |  |   |  |(|  .-.  ||  .___.'.-._)   \
--  |  |\   \ |  `---. `-/   /`      |  |   |  | |  | |  ||  |     \       /
--  `--' '--' `------'   `--'        `--'   `--' `--' `--'`--'      `-----'
--

-- Usage:
-- keymap.set(mode:string, keybinds:str, map:str)
local keymap = vim.keymap

-- leader to be space key
vim.g.mapleader = " "

-- ctrl-s to save a buffer
keymap.set("n", "<C-s>", ":w<CR>")
-- use jk to quit insert mode to normal mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohlsearch<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leadr>-", "<C-x>") -- decrement
