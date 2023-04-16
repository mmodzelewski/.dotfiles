local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-n>', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
