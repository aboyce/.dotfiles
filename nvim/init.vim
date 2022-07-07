"" ------------------------------------------------------
"" AUTOMATIC INSTALLATION AND PLUGIN INSTALLATION - START
"" ------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" ----------------------------------------------------
"" AUTOMATIC INSTALLATION AND PLUGIN INSTALLATION - END
"" ----------------------------------------------------

" TODO: UPDATE THE PLUGIN DIRECTORY TO MATCH
call plug#begin('~/.config/nvim/plugins/vim-plug')

" theme
Plug 'gruvbox-community/gruvbox'

" comments
Plug 'preservim/nerdcommenter'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ensure 'preservim/nerdcommenter' works
filetype plugin on

"" ----------------------------------------------------
"" CODE COMPLETION - START
"" ----------------------------------------------------

" telescope configuration
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-g> :lua require('telescope.builtin').git_status()<CR>

" airline configuration
let g:airline#extension#capslock#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
" fix a layout issue in the bottom right corner
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' '

" coc configuration
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-markdownlint',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-highlight',
\]

" allow coc-highlight to work
"set termguicolors
" trigger code completion
inoremap <silent><expr> <c-space> coc#refresh()
" allow coc-hightligh to open
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" ----------------------------------------------------
"" CODE COMPLETION - END
"" ----------------------------------------------------

lua require('aboyce')

let mapLeader = " "

"" ----------------------------------------------------
"" THE FOLLOWING SHOULD BE IN THE EXISTING CONFIG - CAN REMOVE
"" ----------------------------------------------------

colorscheme gruvbox
set number
set relativenumber
set hidden
set nowrap
set incsearch
set scrolloff=8
set signcolumn=yes
imap ii <Esc>
