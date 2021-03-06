call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'a.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-sleuth'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'bruno-/vim-man'
Plug 'achalddave/cscope_macros.vim'
Plug 'derekwyatt/vim-scala'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'reedes/vim-lexical'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

nnoremap <leader>e :bnext<CR>
nnoremap <leader>w :bprevious<CR>
set dictionary='/usr/share/dict/words'
set clipboard=unnamed
syntax enable
set autochdir
colorscheme solarized
set backspace=indent,eol,start
set background=dark
set hidden
set nu
set cursorline
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present
set tags=./tags,tags;
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set nocompatible
set noswapfile
set nobackup
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>r :CtrlPTag<CR>

nmap <F8> :TagbarToggle<CR>
let mapleader=","
let g:ycm_path_to_python_interpreter = '/usr/bin/python'


"highlight all matches
set hlsearch
" Make 81st column standout
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100) 
"make trailing spaces and tabs stand out 
autocmd BufNewFile,BufReadPost *.hn set filetype=cpp
"map semicolon to colon
nnoremap ; :
nnoremap : ;

if exists('g:space_tabs')
    set listchars=nbsp:_,trail:.,tab:>~
    set list
endif


filetype on
filetype plugin on
filetype indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

let g:ycm_collect_identifiers_from_tags_files = 1

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>

set noerrorbells
set novisualbell

set shell=/bin/zsh

noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>r :CtrlPTag<CR>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

let g:python_host_prog = '/usr/bin/python'

""""""""""""" My cscope/vim key mappings
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"


" To do the first type of search, hit '<leader>', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nnoremap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>  
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>  

nnoremap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>   
nnoremap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>   
nnoremap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>   
nnoremap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>   
nnoremap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>   
nnoremap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
nnoremap <C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>   
nnoremap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>   


nnoremap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
nnoremap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
nnoremap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
nnoremap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
nnoremap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
nnoremap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
nnoremap <C-@><C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR> 
nnoremap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 
set pastetoggle=<F10>

