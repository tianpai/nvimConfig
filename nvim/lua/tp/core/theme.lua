--   _   _
--  | |_| |__   ___ _ __ ___   ___
--  | __| '_ \ / _ \ '_ ` _ \ / _ \
--  | |_| | | |  __/ | | | | |  __/
--   \__|_| |_|\___|_| |_| |_|\___|
--

local status, _ = pcall(vim.cmd, "colorscheme ayu")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
