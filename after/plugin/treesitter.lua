--- >>> Crystal Lang >>>
vim.api.nvim_create_autocmd("User", {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').crystal = {
      install_info = {
        url = 'https://github.com/crystal-lang-tools/tree-sitter-crystal',
        -- path = '<ts-crystal-install-path>', -- if you want to use a local version instead
        generate = false,
        generate_from_json = false,
        queries = 'queries/nvim'
      },
    }
  end,
})

vim.treesitter.language.register("crystal", { "cr" })
--- <<< Crystal Lang <<<

--- >>> File Extension Association >>>
vim.filetype.add({
  extension = {
    cs = "c_sharp",
  }
})
--- <<< File Extension Association <<<

local languages = {
  "c",
  "c3",
  "c_sharp",
  "cpp",
  "crystal",
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