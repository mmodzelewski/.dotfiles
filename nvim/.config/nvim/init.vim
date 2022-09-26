set number
set relativenumber
set hlsearch
set ignorecase
set incsearch
set cursorline
set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors

call plug#begin()
" theme
Plug 'lifepillar/vim-gruvbox8'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" other
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

lua require('mmx')
lua require('telescope').load_extension('fzf')

set background=dark
colorscheme gruvbox8
let g:netrw_banner = 0
let g:netrw_winsize = 25

let mapleader = " "
nnoremap <leader>pv :Ex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <leader>pf :Telescope find_files<CR>
nnoremap <leader>rb :Telescope buffers<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

autocmd BufWritePre *.go lua OrgImports(1000)
