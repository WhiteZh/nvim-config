vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.isfname:append("@-@")

vim.g.mapleader = " "

vim.keymap.set('n', "<leader>fe", vim.cmd.Ex, {})
vim.keymap.set('n', "<leader>te", ':te /usr/local/bin/bash --init-file "~/.bash_profile" -i<CR>:setlocal nonu<CR>:setlocal norelativenumber<CR>')
vim.keymap.set('n', "<leader>nu", function()
    vim.opt.nu = true
    vim.opt.relativenumber = true
end)
vim.keymap.set('n', "<leader>nonu", function()
    vim.opt.nu = false
    vim.opt.relativenumber = false
end)
vim.keymap.set('n', "<leader>ts", function()
    vim.ui.input({ prompt = "Enter value for Tab Space: "}, function(input)
        input = tonumber(input)
        vim.opt.tabstop = input
        vim.opt.softtabstop = input
        vim.opt.shiftwidth = input
    end)
end)
