local languages = {
  "rust",
  "python",
  "typescript",
  "lua",
  "c3",
  "c",
  "cpp",
  "javascript",
  "java",
  "go",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
}

require('nvim-treesitter').install(languages):wait(300000)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function()
    vim.treesitter.start()                                    -- highlighting
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
  end,
})