set number
set relativenumber
syntax on

highlight VertSplit cterm=None


set laststatus=2
set wrap
set encoding=utf-8

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set modifiable

set mouse=a

set smartcase

set nocompatible              " be iMproved, required
set splitbelow   " required





let g:termopen=0
let g:termwin=0
function! Terminal()
    if g:termopen==0
        10split
        terminal
        let g:termwin=win_getid()
        let g:termopen=1
    else
        if win_id2win(g:termwin)!=0
            call win_gotoid(g:termwin)
            close


        endif
        let g:termopen=0

    endif



endfunction

nnoremap <C-T> :call Terminal()<CR>
nnoremap <C-u> :UndotreeToggle<CR>
nnoremap <C-r> :NERDTreeToggle<CR>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'nam
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'https://github.com/preservim/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'https://github.com/PhilRunninger/nerdtree-visual-selection.git'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mbbill/undotree'

"Plugin 'ervandew/supertab'

Plugin 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }

Plugin 'nanotech/jellybeans.vim'
Plugin 'EdenEast/nightfox.nvim' " Vim-Plug
Plugin 'Enonya/yuyuko.vim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
Plugin 'hrsh7th/cmp-cmdline'
Plugin 'hrsh7th/nvim-cmp'

" For vsnip users.
Plugin 'hrsh7th/cmp-vsnip'
Plugin 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For mini.snippets users.
" Plug 'echasnovski/mini.snippets'
" Plug 'abeldekat/cmp-mini-snippets'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'




" All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on    " required

colorscheme nightfox




autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


lua << EOF
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    }),
})
EOF


