local status, t_term = pcall(require, "toggleterm")
if not status then
	return
end

t_term.setup({
	open_mapping = [[<c-\>]], -- open terminal with CTRL-\
	hide_numbers = true, -- hide the number column in toggleterm buffers
	autochdir = true, -- automatically change directory when changing terminals
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "float", -- option: 'horizontal' | 'vertical' | 'window' | 'float'
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		highlights = {
			border = "Normal",
			background = "Normal",
		},
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		-- like `size`, width and height can be a number or function which is passed the current terminal
		winblend = 3, -- transparency
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	-- Terminal keymaps
	-- set ESC to go to normal mode
	vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)

	-- Navigate between windows
	-- CTRL + h/j/k/l to move between windows
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

	-- quick `jk` to exit terminal mode
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
