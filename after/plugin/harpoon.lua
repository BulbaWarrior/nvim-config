local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local to_file = function(n)
    return function()
        ui.nav_file(n)
    end
end

vim.keymap.set("n", "<Esc>a", mark.add_file)
vim.keymap.set("n", "<Esc>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<M-1>", to_file(1))
vim.keymap.set("n", "<M-2>", to_file(2))
vim.keymap.set("n", "<M-3>", to_file(3))
vim.keymap.set("n", "<M-4>", to_file(4))
