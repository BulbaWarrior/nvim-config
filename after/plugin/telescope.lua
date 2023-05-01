local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
local bind = vim.keymap.set
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "**/Games/**")

telescope.setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/Games/**" },
        }
    }
})


local builtin = require('telescope.builtin')
bind('n', '<leader><leader>', builtin.find_files, {})
bind('n', '<leader>/', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
bind('n', '<M-x>', builtin.keymaps, {})
