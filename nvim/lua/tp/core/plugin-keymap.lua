--          _             _         _
--         | |           (_)       | |
--    _ __ | |_   _  __ _ _ _ __   | | _____ _   _ _ __ ___   __ _ _ __
--   | '_ \| | | | |/ _` | | '_ \  | |/ / _ \ | | | '_ ` _ \ / _` | '_ \
--   | |_) | | |_| | (_| | | | | | |   <  __/ |_| | | | | | | (_| | |_) |
--   | .__/|_|\__,_|\__, |_|_| |_| |_|\_\___|\__, |_| |_| |_|\__,_| .__/
--   | |             __/ |                    __/ |               | |
--   |_|            |___/                    |___/                |_|

local keymap = vim.keymap

--    _____ _ _        _____
--   |  ___(_) | ___  |_   _| __ ___  ___
--   | |_  | | |/ _ \   | || '__/ _ \/ _ \
--   |  _| | | |  __/   | || | |  __/  __/
--   |_|   |_|_|\___|   |_||_|  \___|\___|
--
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--    _____    _
--   |_   _|__| | ___  ___  ___ ___  _ __   ___
--     | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--     | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--     |_|\___|_|\___||___/\___\___/| .__/ \___|
--                                  |_|
-- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- find string in current working directory
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- find string under cursor in current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- list open buffers in current neovim instance
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- list available help tags
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
