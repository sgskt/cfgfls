" ******************************************************************************
" General options
" ******************************************************************************

" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
filetype off
" Command behavior
set history=50
set ruler
set showcmd
" Search behavior
set incsearch
set hlsearch
set number
" Disable .swp
set nobackup
set nowritebackup
set noswapfile
" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" 80-char line
set cc=80
" Status line
set laststatus=2
" Allow backspace
set backspace=indent,eol,start
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" clipboard with mac
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
:map <F3> :r !pbpaste<CR>
" Spell check highlight
hi SpellBad ctermfg=magenta
" netrw
let g:netrw_liststyle = 3
" Vertical and horizontal split buffer with HbN and VbN
command -nargs=1 Vb vsp | b <args>
command -nargs=1 Hb sbuffer <args>
" Diff since last save
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" ******************************************************************************
" Stata stuff
" ******************************************************************************

" Console stata - requires tmux
function! Get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return lines
endfunction

function Start_stata()
    let pwd=system('pwd')
    let curfile=expand('%:p')
    call system('if [ -z "$TMUX" ]; then; tmux new-session; else; tmux new-window; fi;')
    call system('tmux split-window -h')
    let window=system("tmux display-message -p '#S:#I'")
    call system('tmux send-keys -t ${window}.left "vim '.curfile.'" c-m')
    call system('tmux send-keys -t ${window}.right "stata-mp" c-m')
endfunction

function Send_stata() range
    let text=Get_visual_selection()
    let pwd=system('pwd')
    let tmpfile=system('echo -n "/tmp/stata_$(date +%s).do"')
    call writefile(["cd ".pwd."\n"]+text,tmpfile)
    call system("tmux send-keys -t right 'do ".tmpfile."' c-m")
    call system("rm ".tmpfile)
endfunction

" For stata GUI - requires separate shell scripts in $PATH
function RunIt()
  wa
  !do-file "%:p"
endfunction
function RunDoLines()
  '<,'>w !do-selection
endfunction

" Mappings
:map <F4> :call Start_stata()<CR>
:vmap <F5> :call Send_stata()<CR>
:map <F6> :<C-U>call RunIt()<CR><CR>
:vmap <F7> :<C-U>call RunDoLines()<CR><CR>

" ******************************************************************************
" Vundle
" ******************************************************************************
"
" Vundle init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins - including Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'jpitblado/vim-stata'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'wincent/command-t'
Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" Vundle cleanup
call vundle#end()
filetype plugin indent on

" ******************************************************************************
" Plugin-specific options
" ******************************************************************************

" latex-box
let g:LatexBox_Folding=1
let g:LatexBox_quickfix=4
let g:LatexBox_viewer="apvlv"
let g:LatexBox_latexmk_preview_continuously=1

" R plugin options
let r_syntax_folding = 1

" Stata

" Colorscheme - Solarized for mac and Base16 for Linux
set background=dark
if (match(system("uname -s"),"Darwin")!=-1)
    colorscheme solarized
else
    colorscheme base16-solarized
endif

" Bufferline
let g:bufferline_echo = 0

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#hunks#enabled=0

set noshowmode
let g:airline_left_sep=''
let g:airline_right_sep=''
function! AirlineInit()
    let g:airline_section_a=airline#section#create(['branch'])
    let g:airline_section_b=''
    let g:airline_section_x=''
    let g:airline_section_y=''
    let g:airline_section_z=airline#section#create(['%3p%%'])
endfunction
autocmd VimEnter * call AirlineInit()

" Gitgutter
highlight clear SignColumn
