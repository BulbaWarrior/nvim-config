vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>fp", function()
    vim.cmd.Ex "~/.config/nvim/"
end)

vim.keymap.set("v", "J", ":m >+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m <-2<CR>gv=gv")

vim.keymap.set("n", "<M-s>", vim.cmd.sp)
vim.keymap.set("n", "<M-v>", vim.cmd.vs)
vim.keymap.set("n", "<M-q>", vim.cmd.q)

local function setMoveToWindow(direction)
    vim.keymap.set("n", string.format("<M-%s>", direction), function ()
        vim.cmd.wincmd(direction)
    end)
end

setMoveToWindow('h')
setMoveToWindow('j')
setMoveToWindow('k')
setMoveToWindow('l')
