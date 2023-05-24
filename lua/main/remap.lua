vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd [[cnoremap <C-j> <C-n>]]
vim.cmd [[cnoremap <C-k> <C-p>]]

vim.keymap.set("n", "<leader>fp", function()
    vim.cmd.Ex "~/.config/nvim/"
end)

vim.keymap.set({ "n", "t" }, "<M-s>", vim.cmd.sp)
vim.keymap.set({ "n", "t" }, "<M-v>", vim.cmd.vs)
vim.keymap.set({ "n", "t" }, "<M-q>", vim.cmd.q)

-- move between windows with <M-hjkl>
local function setMoveToWindow(direction)
    vim.keymap.set({ "n", "t" }, string.format("<M-%s>", direction), function()
        vim.cmd.wincmd(direction)
    end)
end

setMoveToWindow('h')
setMoveToWindow('j')
setMoveToWindow('k')
setMoveToWindow('l')

-- yakny
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleBackward)")
vim.keymap.set("n", "<M-p>", "<CMD>Telescope yank_history<CR>")

-- nvterm
local term = require("nvterm.terminal")
local term_toggle = function(x)
    return function()
        term.toggle(x)
    end
end
vim.keymap.set("n", "<leader>ot", term_toggle "horizontal")
vim.keymap.set("n", "<leader>oht", term_toggle "horizontal")
vim.keymap.set("n", "<leader>ovt", term_toggle "vertical")
vim.keymap.set("n", "<leader>oft", term_toggle "float")

--Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', telescope.find_files, {})
vim.keymap.set('n', '<leader>/', telescope.live_grep)
vim.keymap.set('n', '<M-x>', telescope.keymaps, {})
