vim.keymap.set("n", "<M-u>", function()
    vim.cmd.UndotreeToggle()
    vim.cmd.UndotreeFocus()
end
)
