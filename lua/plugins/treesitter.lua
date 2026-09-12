return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  opts={
    ensure_installed={
        "c","lua","vim","vimdoc","query","markdown","markdown_inline","python",
    },

    highlight={
        enable=true,
    },
    indent={
        enable=true,
    },
  },

  config=function()
      vim.api.nvim_create_autocmd("FileType",{
          callback=function ()
              pcall(vim.treesitter.start)
          end,
        })
  end,
}
