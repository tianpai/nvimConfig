-- import which-key
local status, al = pcall(require, "alpha")
if not status then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"  ██████████████████████████████████████████  ",
	"  ██████████████████████████████████████████  ",
	"  ████                                  ████  ",
	"  ████   ███    ██████████████████████  ████  ",
	"  ████  ████   ███████████████████████  ████  ",
	"  ████  ████   ████                     ████  ",
	"  ████  ████   ████                     ████  ",
	"  ████   ███   ████   ████████████████  ████  ",
	"  ████         ████   ████████████████  ████  ",
	"  ████   ███   ████  ████               ████  ",
	"  ████  ████   ████  ████               ████  ",
	"  ████  ████   ████  ████   ██████████  ████  ",
	"  ████  ████   ████  ████   █████████   ████  ",
	"  ████   ███   ████  ████   ████        ████  ",
	"  ████         ████  ████   ████        ████  ",
	"  ████  ████   ████  ████   ████  ████  ████  ",
	"  ████  ████   ████  ████   ████  ████  ████  ",
	"  ████  ████   ████  ████   ████  ████  ████  ",
	"  ████  ████   ████  ████   ████  ████  ████  ",
	"  ████                                  ████  ",
	"  ██████████████████████████████████████████  ",
	"  ██████████████████████████████████████████  ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("n", "󰙅  > File Tree", ":NvimTreeFocus<CR>"),
	dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  > Nvim Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

al.setup(dashboard.opts)
