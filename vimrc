set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" All of your Plugins must be added before the following line

Bundle 'idanarye/vim-dutyl'
Bundle 'dlang-community/DCD'
"Bundle 'landaire/deoplete-d'
"Bundle 'tweekmonster/deoplete-clang2'
"Bundle 'Shougo/deoplete.nvim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bkad/CamelCaseMotion'
Plugin 'mhinz/vim-startify'

" ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'ervandew/supertab'
Plugin 'kiith-sa/DSnips'

" JS plugins
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set autoindent
set number
set so=7
set ruler
set cmdheight=2
set ignorecase
"set smartcase
set hlsearch
set incsearch
set magic
set smarttab

" Set tabs and their width for kernel development
if (system('pwd | grep "/home/fawkes/Facultate/AnulIV/SO2\|/home/fawkes/SO2"') != "")
    "echom "Working on kernel stuff"
    set noexpandtab
    set shiftwidth=8
    set tabstop=8
else
    "echom "Not working on kernel stuff"
    set expandtab
    set shiftwidth=4
    set tabstop=4
endif

set ai
set si
set wrap
" no swap file
set noswapfile
set wildmenu	" visual autocomplete for command menu
set lazyredraw	" redraw only when need to
set showmatch	" highlight matching braces
set formatoptions-=o "dont continue comments when pushing o/O
"set foldenable	" enable folding
"set foldmethod=indent " fold based on indent level

set pastetoggle=<F2>

filetype indent on	" load	filetype-specific indent files

set exrc " enable per directory vimrc
set secure " ensures that shell, autocmd and write commands are not allowed
           " in the .vimrc file that was found in the current directory


"""""""""""""""
" DelimitMate "
"""""""""""""""

imap <C-c> <CR><Esc>O

"""""""""""""""
" Status line "
"""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Column:\ %c

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

""""""""""""
" NERDTree "
""""""""""""

" Map C-N to open NERDTree
map <C-N> :NERDTreeToggle<CR>

" Close vim when the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""
" CtrlP "
"""""""""

let g:ctrlp_working_path_mode = 'ra'

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 1gtgT

" Resize window
nnoremap + <C-W>+
nnoremap _ <C-W>-
nnoremap = <C-W>>
nnoremap - <C-W><

"""""""""""""""""""""""""
" Highlight cursor line "
"""""""""""""""""""""""""

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=None ctermfg=None
hi NonText ctermbg=None

"""""""""""""""""""
" Set colorscheme "
"""""""""""""""""""

" colorscheme peaksea.vim
if ! has("gui_running")
        set t_Co=256
endif
" colors peaksea
colors gruvbox
"colors transparent
"colors badwolf

" feel free to choose :set background=light for a different style
set background=dark
"set background=light


" From Vlad Dogaru

if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0 " Use cscope first, then ctags
        set cst " Only search cscope
        set csverb " Make cs verbose

        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

        nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

        " Open a quickfix window for the following queries.
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

" Kudos darius-m

vnoremap <C-k> :<C-u>silent! '<,'>m '<-2<CR>`[V`]
vnoremap <C-j> :<C-u>silent! '<,'>m '>+1<CR>`[V`]

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" Open new vertical splits to the right of current one.
set splitright

" End from VD

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"""""""
" YCM "
"""""""

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_always_populate_location_list = 1

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = {'d': ['.', 're![a-zA-Z]']}

" Add autocomplete for languages that are not supported by ycm
"if has("autocmd") && exists("+omnifunc")
        "autocmd Filetype *
                    "\   if &omnifunc == \"\" |
                    "\       setlocal omnifunc=syntaxcomplete#Complete |
                    "\   endif
            "endif

"""""""""""""
" Syntastic "
"""""""""""""

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_d_config_file="~/.syntastic_d_config"
let g:syntastic_d_compiler = "/home/edis/workspace/dlang/code/dmd/generated/linux/release/64/dmd"

let g:syntastic_d_compiler_options = "-I~/workspace/dlang/code/druntime/import/ -I~/workspace/dlang/code/phobos -L-L$HOME/workspace/dlang/code/phobos/generated/linux/release/64/"

" Go to previous error. Allow :lprev to work with empty location list, or at first location
function! <SID>LocationPrevious()
    try
        lprev
    catch /:E553:/
        llast
    catch /:E\%(42\|776\):/
        echo "Location list empty"
    catch /.*/
        echo v:exception
    endtry
endfunction

" Go to next error. Allow :lnext to work with empty location list, or at first location
function! <SID>LocationNext()
    try
        lnext
    catch /:E553:/
        lfirst
    catch /:E\%(42\|776\):/
        echo "Location list empty"
    catch /.*/
        echo v:exception
    endtry
endfunction

nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> E[ <Plug>LocationPrevious
nmap <silent> E] <Plug>LocationNext

"""""""""""""
" UltiSnips "
"""""""""""""

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

set tags+=./.tags


"""""""""""""
" vim-dutyl "
"""""""""""""

" Also USE https://github.com/BitR/ycmd-dcd for YCM

let g:dutyl_stdImportPaths=['~/workspace/dlang/code/druntime/import/', '~/workspace/dlang/code/phobos/']

call dutyl#register#tool('dcd-client', '/home/edis/.vim/bundle/DCD/bin/dcd-client')
call dutyl#register#tool('dcd-server', '/home/edis/.vim/bundle/DCD/bin/dcd-server')

nnoremap <F10> :DUvjump<CR>
nnoremap <F11> :DUddoc<CR>

let mapleader = ";"

call camelcasemotion#CreateMotionMappings('<leader>')

""""""""""""
" deoplete "
""""""""""""

"let g:deoplete#enable_at_startup = 1

"let g:deoplete#sources#d#dcd_client_binary = '/home/student/DCD/bin/dcd-client'
"let g:deoplete#sources#d#dcd_server_binary = '/home/student/DCD/bin/dcd-server'
"let g:deoplete#sources#d#dcd_server_autostart = 1

"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/3.8/include/'

"autocmd CompleteDone * pclose!

"""""""""
" Extra "
"""""""""

" Wrap a word in "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Wrap a word in comments using NerdCommenter
"nnoremap <leader>/ viw<esc>a*/<esc>bbi/*<esc>lell
nmap <leader>/ viw<leader>ccf<space>

" Select inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>

" Select inside last parentheses
onoremap il( :<c-u>normal! F)vi(<cr>

" Search reg S and replace with reg R
cmap <leader>r s/<c-r>s/<c-r>r/gc

" Save current word into search reg S
nnoremap <leader>ss viw"sy

" Save current word into replace reg R
nnoremap <leader>sr viw"ry

" Save sessions on quit
let g:startify_session_persistence = 1
