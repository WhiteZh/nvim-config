vim.o.fileformat = "unix"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
if vim.loop.os_uname().sysname == 'Windows_NT' then
    vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

    vim.opt.shell = "sh"
end
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.isfname:append("@-@")

vim.g.mapleader = " "

vim.keymap.set('n', "<leader>fe", vim.cmd.Ex, { desc = "Open file explorer" })
-- vim.keymap.set('n', "<leader>te", ':te /usr/local/bin/bash --init-file "~/.bash_profile" -i<CR>:setlocal nonu<CR>:setlocal norelativenumber<CR>', { desc = "Open terminal" })
vim.keymap.set('n', "<leader>nu", function()
    vim.opt.nu = true
    vim.opt.relativenumber = true
end, { desc = "Enable line numbering" })
vim.keymap.set('n', "<leader>nonu", function()
    vim.opt.nu = false
    vim.opt.relativenumber = false
end, { desc = "Disable line numbering" })
vim.keymap.set('n', "<leader>ts", function()
    vim.ui.input({ prompt = "Enter value for Tab Space: "}, function(input)
        input = tonumber(input)
        vim.opt.tabstop = input
        vim.opt.softtabstop = input
        vim.opt.shiftwidth = input
    end)
end, { desc = "Set tab space" })



-- filetype specific behaviors
vim.api.nvim_create_autocmd("FileType", {
    pattern = "scala",
    callback = function()
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"haskell", "crystal"},
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})
