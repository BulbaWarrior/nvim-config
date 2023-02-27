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

-- for MacOs
vim.keymap.set("n", "ß", vim.cmd.sp) -- <M-s>
vim.keymap.set("n", "√", vim.cmd.vs) -- <M-v>
vim.keymap.set("n", "œ", vim.cmd.q) -- <M-q>

local function setMoveToWindowMac(symbol, direction)
	vim.keymap.set("n", string.format("%s", symbol), function()
		vim.cmd.wincmd(direction)
	end)
end

setMoveToWindowMac('˙', 'h')
setMoveToWindowMac('∆', 'j')
setMoveToWindowMac('˚', 'k')
setMoveToWindowMac('¬', 'l')
