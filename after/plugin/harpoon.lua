local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<Esc>a", mark.add_file)
vim.keymap.set("n", "<Esc>e", ui.toggle_quick_menu)
