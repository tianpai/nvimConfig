-- import which-key
local status, al = pcall(require, "alpha")
if not status then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
local headers = require("tp.plugins.alpha.pics")
local logos, len = headers.get_all()
dashboard.section.header.val = logos[math.random(len)]

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("n", "󰙅  > File Tree", ":NvimTreeFocus<CR>"),
	dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  > Nvim Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("c", "󱆀  > Courses", ":cd $HOME/Utsc/courses/ | :Telescope file_browser<CR>"),
	dashboard.button("d", "󱡞  > Code Dump", ":e $HOME/Documents/codedump/ | split . "),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
	-- add a new empty line
}

-- Set footer
local function footer()
	local total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

dashboard.section.footer.val = footer()

al.setup(dashboard.opts)
