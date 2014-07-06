" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Pathogen
call pathogen#infect()
filetype plugin indent on

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

"line numbers
set number

"disable .swp and ~ files
set nobackup
set nowritebackup

"ident size
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"latex-box
let g:LatexBox_Folding=1
let g:LatexBox_viewer = 'Preview'
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_latexmk_options = '-pv'


"R plugin options
let r_syntax_folding = 1


" Stata things
function RunIt()
  wa
  !do-file "%:p"
endfunction

:map <F5> :<C-U>call RunIt()<CR><CR>
:imap <F5> <Esc>:<C-U>call RunIt()<CR><CR>

function RunDoLines()
  '<,'>w !do-selection
endfunction

:vmap <F6> :<C-U>call RunDoLines()<CR><CR>

" Colorscheme - Solarized for mac and Base16 for Linux
syntax enable
if (match(system("uname -s"),"Darwin")!=-1)
    set background=dark
    colorscheme solarized
else
    set background=light
    colorscheme base16-solarized
endif

" 80-char line
set cc=80
