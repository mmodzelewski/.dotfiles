vim.keymap.set("n", "gs", vim.cmd.Git);
vim.keymap.set("n", "gnb", function ()
    vim.cmd.Git("checkout -b " .. vim.fn.input("New branch name: "));
end);
