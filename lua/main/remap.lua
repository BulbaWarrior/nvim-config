vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>fp", function()
    vim.cmd.Ex "~/.config/nvim/"
end)

vim.keymap.set("n", "<M-s>", vim.cmd.sp)
vim.keymap.set("n", "<M-v>", vim.cmd.vs)
vim.keymap.set("n", "<M-q>", vim.cmd.q)

-- move between windows with <M-hjkl>
local function setMoveToWindow(direction)
    vim.keymap.set("n", string.format("<M-%s>", direction), function()
        vim.cmd.wincmd(direction)
    end)
end

setMoveToWindow('h')
setMoveToWindow('j')
setMoveToWindow('k')
setMoveToWindow('l')

-- system clipboard
vim.keymap.set("i", "<C-v>", "<Esc>\"+pa")
vim.keymap.set("v", "<C-c>", "\"+y")
