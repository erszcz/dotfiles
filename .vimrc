" Olewamy styl Vi
set nocompatible

" Rozwijanie tabow
"set expandtab
set et 

" Indentation
" -----------
set autoindent  " indent to previous line indentation level
filetype indent on

" nice autocompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

" Szerokosc taba w tekscie
set tabstop=4

" Szerokosc wciecia (lub autowciecia)
set shiftwidth=4
" Ilosc spacji wstawiana za taba
set softtabstop=4

" tab we wcieciu wstawia shiftwidth spacji
set smarttab

" Automatyczna zmiana biezacego katalogu na ten, w ktorym znajduje sie edytowany plik
"set autochdir ":se acd

" Sprytne szukanie
" wzorzec - tylko male litery -> dopasowuj male/duze
" wzorzec - mieszane litery -> dopasowuj dokladnie
set ignorecase
set smartcase

" Numerowanie linii
set nu

" Zawijanie wierszy (off)
set nowrap

" Turn Brace/Bracket match showing off
set noshowmatch

" Setup backup location and enable
set backupdir=$HOME/.vim/backupdir
set backup

" Set Swap directory
set directory=$HOME/.vim/swapdir

" Set persistent undo
"set undodir=$HOME/.vim/undodir
"set undofile

" Kolorowanie skladni
syntax on

" Backspace przez wszystko
"set backspace=eol,indent,start
set backspace=2

" Kodowanie
set encoding=utf8

" Rozmiary: szerokosc
"set columns=141
" Rozmiary: wysokosc
"set lines=46

" Make shift-insert work like in Xterm
"map <S-Insert> <MiddleMouse>
"map! <S-Insert> <MiddleMouse>

" Podswietlenie linii kursora
set cursorline

" Szukanie przez koniec dokumentu
set incsearch

" Podswietlenie wynmikow searcha
set hlsearch

" Komentarzowanie
" Feral wylaczony, zamist niego NERD_commenter
"execute "source ~/.vim/FeralToggleCommentify.vim"
"map <C-c> :TC<CR>j 
"imap <C-c> <ESC>:TC<CR>j 
map <C-c> ,c<space>
imap <C-c> ,c<space>

" Paste Mode On/Off
map <Leader>p :call Paste_on_off()<CR>
set pastetoggle=<F11>p

let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
        if g:paste_mode == 0
                set paste
                let g:paste_mode = 1
        else
                set nopaste
                let g:paste_mode = 0
        endif  
        return
endfunc 

" GUI/non-GUI colorscheme settings
if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ 9
  set guioptions=
  "set guioptions-=m
  "set guioptions-=T
  set guicursor=a:blinkon0-block

  " outdoor or indoor work?
  if filereadable($HOME . "/.outdoor.on")
    let g:xterm16_ccube     = "005f87afd7ff"
    let xterm16_colormap    = 'softlight'
    let xterm16_brightness  = 'high'
    colo xterm16
  else
    colorscheme cthulhian
  endif
else
  " enable 256 colors
  au VimEnter *
    \	if &term == 'xterm'	|
    \		set t_Co=256			|
    \	endif

  au VimEnter *
    \	if &term == 'rxvt-unicode'	|
    \		set t_Co=256			|
    \	endif

  " outdoor or indoor work?
  if filereadable($HOME . "/.outdoor.on")
    let g:xterm16_ccube     = "005f87afd7ff"
    let xterm16_colormap    = 'softlight'
    let xterm16_brightness  = 'high'
    colo xterm16
  else
"    colorscheme inkpot
    colorscheme zenburn
  endif
endif

" vim wiki setup
set tags=./tags,./TAGS,tags,TAGS,$HOME/docs/wiki/tags,$HOME/.vim/system_tags
autocmd BufWritePost $HOME/docs/wiki/*.txt :helptags $HOME/docs/wiki

" dodawanie nawiasu wokol slowa przez Ctrl-B w trybie interaktywnym
imap <C-b> <Space>)<Esc>bi(<Esc>f)i

" autosave changes when switching buffers
"set autowrite

" vala support
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

" ooc support
au BufNewFile,BufRead *.ooc set filetype=ooc

" commandline: marks -> ms
cabbr ms marks

" abbrs
iabbr /* /* */<Esc>2hi

" autocorrections
source $HOME/.vim/autocorrect-lavrin.vim

" half page up/down
"map <S-j> <C-d>
"map <S-k> <C-u>

" save on w/W instead of w only
cabbr Q q
cabbr W w
cabbr WQ wq
cabbr Wq wq
cabbr Ed ed

" quickly open file (anywhere) below current directory
nmap <a-t> :e **/

se foldcolumn=2

" rst/asciidoc header macro
let @h = "yypVr"

" remap w, b, e to camelCase aware functions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
nmap <silent> <C-Left> <Plug>CamelCaseMotion_b
nmap <silent> <C-Right> <Plug>CamelCaseMotion_e
imap <silent> <C-Left> <Plug>CamelCaseMotion_b
imap <silent> <C-Right> <Plug>CamelCaseMotion_e

" autotag - regenerate tags file on buffer write
source $HOME/.vim/autotag.vim

cabbr bs buffers

" vimorganiser/orgmode vimrc
source $HOME/.vim/_vimrc-orgmode

" default encryption method
set cryptmethod=blowfish

" taglist hotkey
map <Leader>tl :TlistToggle<Return>

" buffer list hotkey
map <Leader>b :buffers<Return>

set ruler

" automatically change working directory to file's directory
"autocmd BufRead,CmdwinEnter *.* cd %:h

" copy to global clipboard, not just yank
map <Leader>y "+y

" sane (bash-like) filename completion style
set wildmode=longest:full
set wildmenu

" nicer window switching
map <Leader>w <C-w>

" :tabnew shortcut
map <Leader>tn :tabnew<CR>

" show file name
map <Leader>f :file<CR>

" simplenote credentials
source ~/.simplenoterc

" used in snippet expansion
let g:author    = 'Radosław Szymczyszyn'
let g:copyright = 'Radosław Szymczyszyn'

" statusline with filename, buffer info, ruler
set laststatus=2  " display statusline no matter how many windows open
set statusline=%<%f\ %h%m%r%q%=%-14.(%l,%c%V%)\ %P

" surround: make b surround text with <<",">> in Erlang mode
autocmd FileType erlang let b:surround_98 = "<<\"\r\">>"

" Turn off reindenting on typing closing parens, brackets and curlies.
" Default is:
" indentkeys=0{,0},:,0#,!^F,o,O,e,=after,=end,=catch,=),=],=}
autocmd FileType erlang set indentkeys=0{,0},:,0#,!^F,o,O,e,=after,=end,=catch
