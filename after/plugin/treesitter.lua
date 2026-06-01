local languages = {
  "c",
  "c3",
  "c_sharp",
  "cpp",
  "go",
  "haskell",
  "html",
  "java",
  "javascript",
  "json",
  "julia",
  "kotlin",
  "lua",
  "markdown",
  "markdown_inline",
  "nu",
  "python",
  "query",
  "rust",
  "scala",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
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