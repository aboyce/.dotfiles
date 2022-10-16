"  ____   _                _
" |  _ \ | | _   _   __ _ (_) _ __   ___
" | |_) || || | | | / _` || || '_ \ / __|
" |  __/ | || |_| || (_| || || | | |\__ \
" |_|    |_| \__,_| \__, ||_||_| |_||___/
"                   |___/

" Plugin Manager: vim-plug

" Recommended automatic installation from - https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.config/nvim/plugins/vim-plug')

" Themes
Plug 'gruvbox-community/gruvbox'

" Comments
Plug 'preservim/nerdcommenter'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Telescope (and dependencies)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'

" Git Information
Plug 'APZelos/blamer.nvim'

call plug#end()

"   ____                                 _
"  / ___|  ___  _ __    ___  _ __  __ _ | |
" | |  _  / _ \| '_ \  / _ \| '__|/ _` || |
" | |_| ||  __/| | | ||  __/| |  | (_| || |
"  \____| \___||_| |_| \___||_|   \__,_||_|

" Load in Lua config
lua require('aboyce')

" Set the leader to a space
let mapleader = " "

" Keep a buffer in the background in case you forget to save
set hidden

" Wrap the text 
set wrap

" Start scrolling when you are close to the edge of the file
set scrolloff=8

" Show an error/linting column on the left hand side (also useful for COC)
set signcolumn=yes


"  ____   _           _
" / ___| | |_  _   _ | |  ___
" \___ \ | __|| | | || | / _ \
"  ___) || |_ | |_| || ||  __/
" |____/  \__| \__, ||_| \___|
"              |___/

" The theme
colorscheme gruvbox

" Numbers on the left hand side
set number

" Show the relative number to the current line
set relativenumber

autocmd FileType markdown hi Pmenu ctermfg=Black ctermbg=White
autocmd FileType markdown hi PmenuSel ctermfg=Black ctermbg=White
autocmd FileType markdown hi FgCocErrorFloatBgCocFloating ctermfg=Black ctermbg=White guifg=White guibg=Black

" __        __ _             _
" \ \      / /(_) _ __    __| |  ___ __      __ ___
"  \ \ /\ / / | || '_ \  / _` | / _ \\ \ /\ / // __|
"   \ V  V /  | || | | || (_| || (_) |\ V  V / \__ \
"    \_/\_/   |_||_| |_| \__,_| \___/  \_/\_/  |___/

" Split new windows in a normal direction
set splitbelow
set splitright

" Create a new vertical window
nnoremap <leader>- :new<cr>
" Create a new horizontal window
nnoremap <leader><Bar> :vnew<cr>

" Change windows with Vim style direction
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <<C-W><C-K>
nnoremap <leader>l <C-W><C-L>

"  _____     _  _  _    _
" | ____| __| |(_)| |_ (_) _ __    __ _
" |  _|  / _` || || __|| || '_ \  / _` |
" | |___| (_| || || |_ | || | | || (_| |
" |_____|\__,_||_| \__||_||_| |_| \__, |
"                                 |___/

" Ensure tabs are 4 spaces
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"  ____                _  _  _
" / ___|  _ __    ___ | || |(_) _ __    __ _
" \___ \ | '_ \  / _ \| || || || '_ \  / _` |
"  ___) || |_) ||  __/| || || || | | || (_| |
" |____/ | .__/  \___||_||_||_||_| |_| \__, |
"        |_|                           |___/

" Turn on spell checker
set spell

" Set the correct language
set spelllang=en_gb

"  ____                           _
" / ___|   ___   __ _  _ __  ___ | |__
" \___ \  / _ \ / _` || '__|/ __|| '_ \
"  ___) ||  __/| (_| || |  | (__ | | | |
" |____/  \___| \__,_||_|   \___||_| |_|

" Hightlight the result as you search with '/'
set incsearch

"  _   _        _
" | | | |  ___ | | _ __    ___  _ __  ___
" | |_| | / _ \| || '_ \  / _ \| '__|/ __|
" |  _  ||  __/| || |_) ||  __/| |   \__ \
" |_| |_| \___||_|| .__/  \___||_|   |___/
"                 |_|

" Exit out of INSERT mode quickly
imap ii <Esc>

" Insert a line below the cursor
nnoremap <leader>o o<Esc>

" Insert a line above the cursor
nnoremap <leader>O O<Esc>

"  ____   _                _           ____                __  _
" |  _ \ | | _   _   __ _ (_) _ __    / ___| ___   _ __   / _|(_)  __ _
" | |_) || || | | | / _` || || '_ \  | |    / _ \ | '_ \ | |_ | | / _` |
" |  __/ | || |_| || (_| || || | | | | |___| (_) || | | ||  _|| || (_| |
" |_|    |_| \__,_| \__, ||_||_| |_|  \____|\___/ |_| |_||_|  |_| \__, |
"                   |___/                                         |___/

" Nerd Commenter - General
" ------------------------
" Ensure the plugin can work can work
filetype plugin on

" AirLine - General
" -----------------
let g:airline#extension#capslock#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
" Fix a layout issue in the bottom right corner
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' '

" COC - General
" ----------------
" Having longer updatetime leads to noticeable delays and poor user experience.
set updatetime=300
" Trigger code completion
inoremap <silent><expr> <c-space> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" Remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Show documentation in a preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>sd  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" COC - Extensions
" ----------------
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-markdownlint',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-highlight',
  \ 'coc-rust-analyzer',
  \ 'coc-go',
\]

" COC - Highlight
" ----------------
" Allow coc-highlight to work
" set termguicolors
" Allow coc-highlight to open
autocmd CursorHold * silent call CocActionAsync('highlight')

" Telescope - General
" ------------------
" Do a VSCode style file search for Ctrl + P
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>

" Telescope - Help Tags
" ---------------------
" Lists available help tags and opens a new window with the relevant help info on <cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" Telescope - Find Files
" ---------------------
" Lists files in your current working directory, respects .gitignore
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" Fuzzy search through the output of git ls-files command, respects .gitignore, optionally ignores untracked files
nnoremap <leader>fgf <cmd>lua require('telescope.builtin').git_files()<cr>
" Searches for the string under your cursor in your current working directory
nnoremap <leader>fgs <cmd>lua require('telescope.builtin').grep_string()<cr>
" Search for a string in your current working directory and get results live as you type (respecting .gitignore)ij
nnoremap <leader>fgl <cmd>lua require('telescope.builtin').live_grep()<cr>

" Telescope - Git
" --------------
" Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
" Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
" Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
" Lists stash items in current repository with ability to apply them on <cr>
nnoremap <leader>gstash <cmd>lua require('telescope.builtin').git_stash()<cr>

" Telescope - Buffers
" -------------------
" Lists open buffers in current neovim instance
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>

" Telescope - Previous/Old Files
" ------------------------------
" Lists previously open files
nnoremap <leader>p <cmd>lua require('telescope.builtin').oldfiles()<cr>

" Git Blamer
" ----------
let g:blamer_enabled = 0
let g:blamer_delay = 250
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '
let g:blamer_template = '<committer> <summary>' " <author>, <author-mail>, <author-time>, <committer>, <committer-mail>, <committer-time>, <summary>, <commit-short>, <commit-long>
let g:blamer_date_format = '%d/%m/%y %H:%M'
let g:blamer_relative_time = 1

"  _____  _  _    _
" |_   _|(_)| |_ | |  ___  ___
"   | |  | || __|| | / _ \/ __|
"   | |  | || |_ | ||  __/\__ \
"   |_|  |_| \__||_| \___||___/

" https://patorjk.com/software/taag/#p=display&h=1&v=1&f=Ivrit&t=Titles
