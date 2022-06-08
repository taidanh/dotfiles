" Remap bindings
let mapleader = " "
nnoremap <Leader>; A;<Esc>
nnoremap <Leader>h gT
nnoremap <Leader>l gt
nnoremap <Leader>s :w<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader><Tab> cc
nnoremap <Leader>/ :s/^/\/\//g<CR>
nnoremap <Leader>e <cmd>lua vim.diagnostic.open_float()<CR>

nnoremap <Leader>r <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <Leader>R <cmd>lua vim.lsp.buf.code_action()<cr>

" copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

inoremap jj <Esc>

" Terminal remaps
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-j> <C-\><C-n><C-W>j
tnoremap <C-k> <C-\><C-n><C-W>k
tnoremap <C-l> <C-\><C-n><C-W>l

nnoremap <leader>bf <cmd>Clap files<cr>
nnoremap <leader>bg <cmd>Clap grep2<cr>
nnoremap <leader>bb <cmd>Clap buffers<cr>
nnoremap <leader>bt <cmd>Clap proj_tags<cr>

map <Leader>t :sp term://zsh<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map - <C-W>-
map + <C-W>+

" AUTOCOMMANDS
augroup remember_folds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" autocommand to locally set nonu and nornu in terminal
autocmd TermOpen * setlocal nonu nornu

" VIM PLUG
call plug#begin('~/.vim/plugged')

if !exists('g:vscode') " if not using vim in vscode
    Plug 'sickill/vim-monokai'
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'sainnhe/sonokai'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'NLKNguyen/papercolor-theme'

    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'Pocco81/dap-buddy.nvim'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'jbyuki/one-small-step-for-vimkind'
    Plug 'github/copilot.vim'
    Plug 'wfxr/minimap.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'justinmk/vim-sneak'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'glapa-grossklag/elsa.vim'
    Plug 'akinsho/bufferline.nvim'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'voldikss/vim-floaterm'
endif
Plug 'tweekmonster/startuptime.vim'

call plug#end()

if !exists('g:vscode') " if not using vim in vscode

    " setup GUI COLORS before sourcing
    if has('termguicolors')
            set termguicolors
    endif

    " CONFIG SOURCE
    source $HOME/.config/nvim/plug-config/coq.vim
    source $HOME/.config/nvim/plug-config/clap.vim
    source $HOME/.config/nvim/plug-config/lualine.lua
    source $HOME/.config/nvim/plug-config/sneak.vim
    source $HOME/.config/nvim/plug-config/bufferline.vim
    source $HOME/.config/nvim/plug-config/floaterm.vim
    source $HOME/.config/nvim/plug-config/indent-blankline.vim
    source $HOME/.config/nvim/plug-config/lsp.lua
    source $HOME/.config/nvim/plug-config/tree-sitter.lua
    source $HOME/.config/nvim/plug-config/nvim-tree.vim
    source $HOME/.config/nvim/plug-config/dap/init.lua
    source $HOME/.config/nvim/plug-config/keymaps.lua

" Make sure that vim is in the 
" correct directory on open
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
augroup END

    " COLORSCHEMES
    let g:seoul256_background = 235
    let g:seoul256_light_background = 252
    let g:sonokai_style = 'atlantis'
    "let g:sonokai_transparent_background = 1
    let g:tokyonight_style = 'night'
    let g:tokyonight_day_brightness = 1
    let g:tokyonight_enable_italic = 0.3
    let g:tokyonight_colors = {
      \ 'comment': '#666777',
    \}
    set background=light
    colorscheme PaperColor
endif

" SETTINGS
set nu rnu 
syntax enable
set cursorline
set undodir=$HOME/.config/nvim/undo
set undofile
set mouse=a
set scrolloff=7 " Keep 7 lines below and above the cursor
set splitright
set splitbelow
set nowrap

" FILE SETTINGS
au FileType c setl sw=2 sts=2 tw=80 et commentstring=//\ %s
au FileType cpp setl sw=4 sts=4 tw=80 et commentstring=//\ %s
au FileType makefile setl noexpandtab sw=4 sts=4 tw=80 commentstring=//\ %s
au FileType html setl sw=2 sts=2 tw=80 et
au FileType javascript setl sw=2 sts=2 tw=80 et
au FileType julia setl sw=4 sts=4 tw=80 et
au FileType lilypond setl sw=2 sts=2 tw=100 et commentstring=%\ %s
au FileType lua setl sw=4 sts=4 tw=80 et commentstring=--\ %s
au FileType haskell setl sw=2 sts=0 tw=80 et smarttab commentstring=--\ %s
au FileType python setl sw=4 sts=4 tw=80 et
au FIleType php setl sw=4 sts=4 tw=80 et
au FileType sql setl sw=2 sts=2 tw=80 et
au FileType tex setl sw=2 sts=2 tw=80 et
au FileType vim setl sw=4 sts=4 tw=80 et commentstring=" %s
