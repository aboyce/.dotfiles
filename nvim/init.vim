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

lua require('aboyce')

let mapleader = " "

" insert a line below
nnoremap <leader>o o<Esc>
" insert a line above
nnoremap <leader>O O<Esc>

" telescope configuration
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-g> :lua require('telescope.builtin').git_status()<CR>

" Lists available help tags and opens a new window with the relevant help info on <cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr> 

" Lists files in your current working directory, respects .gitignore
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr> 
" Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
" Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
"Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
"Lists stash items in current repository with ability to apply them on <cr>
nnoremap <leader>gstash <cmd>lua require('telescope.builtin').git_stash()<cr>

" Lists files in your current working directory, respects .gitignore
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" Fuzzy search through the output of git ls-files command, respects .gitignore, optionally ignores untracked files
nnoremap <leader>fgf <cmd>lua require('telescope.builtin').git_files()<cr>
" Searches for the string under your cursor in your current working directory
nnoremap <leader>fgs <cmd>lua require('telescope.builtin').grep_string()<cr>
" Search for a string in your current working directory and get results live as you type (respecting .gitignore)ij
nnoremap <leader>fgl <cmd>lua require('telescope.builtin').live_grep()<cr>

" Lists open buffers in current neovim instance
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
" Lists previously open files
nnoremap <leader>p <cmd>lua require('telescope.builtin').oldfiles()<cr>

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
