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

Bundle 'Valloric/YouCompleteMe'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
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
" colorscheme badwolf
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
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
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
filetype indent on	" load	filetype-specific indent files


"""""""""""""""
" DelimitMate "
"""""""""""""""

imap <C-c> <CR><Esc>O

"""""""""""""
" Syntastic "
"""""""""""""

let g:syntastic_check_on_open=1

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

" colorscheme peaksea.vim
if ! has("gui_running")
        set t_Co=256
endif
" feel free to choose :set background=light for a different style
set background=dark
colors peaksea

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

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
