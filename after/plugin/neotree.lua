vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.keymap.set("n", "<leader>op", vim.cmd.NeoTreeShowToggle)
