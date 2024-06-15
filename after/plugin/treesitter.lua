require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query"
   },
  sync_install = false,
  auto_install = true,
  --ignore_install = { "bash", "c", "cmake", "go", "javascript", "jsdoc", "json", "python", "regex", "ruby", "rust", "typescript"  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
