"
" Use Vundle!
"

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'ervandew/taglisttoo'
"Bundle 'scrooloose/nerdtree'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'bkad/CamelCaseMotion'
Bundle 'ervandew/supertab'
Bundle 'flazz/vim-colorschemes'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'jimenezrick/vimerl'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/neocomplcache'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/xterm16.vim'

filetype plugin indent on

"
" Plugin configuration
"

" nerdcommenter bindings
map <C-c> <Leader>c<space>
imap <C-c> <Leader>c<space>

" CamelCaseMotion aware bindings
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

" taglist toggle
map <Leader>tl :TlistToggle<Return>

" surround: make b surround text with <<",">> in Erlang mode
autocmd FileType erlang let b:surround_98 = "<<\"\r\">>"

" neocomplcache: enable
let g:neocomplcache_enable_at_startup = 1

" neocomplcache: don't try to automatically complete, wait for hitting tab
let g:neocomplcache_disable_auto_complete = 1

"
" Extra filetype support
"

" vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala setfiletype vala
au BufRead,BufNewFile *.vapi setfiletype vala

" ooc
au BufNewFile,BufRead *.ooc set filetype=ooc

"
" Predefined macros/variables
"

" reStructuredText/AsciiDoc header macro
let @h = "yypVr"

" Personal information used in snippet expansion
let g:author	= 'Radosław Szymczyszyn'
let g:copyright	= 'Radosław Szymczyszyn'

"
" Customizations
"

" No Vi compatibility
set nocompatible

" Nice autocompletion
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

" Smart search
" expression is lowercase? match any case hits
" expression is mixed case? find exact matches
set ignorecase
set smartcase

" Number lines
set nu

" Don't wrap lines
set nowrap

" Turn Brace/Bracket match showing off
set noshowmatch

" Enable backups
set backupdir=$HOME/.vim/backupdir
set backup

" Set swap file location
set directory=$HOME/.vim/swapdir

" Enable persistent undo
set undodir=$HOME/.vim/undodir
set undofile

" Syntax highlighting
syntax on

" Backspace through anything
set backspace=2

" UTF FTW!
set encoding=utf8

" Highlight cursor line
set cursorline

" Wrap search past the end of document
set incsearch

" Highlight search results
set hlsearch

" Paste mode toggle
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

" Autoclose C-style block comments
iabbr /* /* */<Esc>2hi

" Autocorrect often misspelled commands/words
iabbr improt import
cabbr Q q
cabbr W w
cabbr WQ wq
cabbr Wq wq
cabbr Ed ed
cabbr Qall qall
cabbr Wqall wqall
cabbr E Explore
cabbr B b

" Display statusline no matter how many windows are open
set laststatus=2

" Statusline with filename, buffer info, ruler
set statusline=%<%f\ %h%m%r%q%=%-14.(%l,%c%V%)\ %P

" Fold column width
se foldcolumn=2

" Show ruler
set ruler

" Colorscheme selection
if $TERM == "linux"
	colorscheme peachpuff
elseif $TERM == "xterm"
	set t_Co=256
	if filereadable($HOME . "/.outdoor.on")
		let g:xterm16_ccube    = "005f87afd7ff"
		let xterm16_colormap   = "softlight"
		let xterm16_brightness = "high"
		colorscheme xterm16
	else
		colorscheme 256-grayvim
	endif
endif

" Default encryption method
set cryptmethod=blowfish

" Buffer list hotkey
map <Leader>b :buffers<Return>

" Make hotkey (good for markup previews)
map <Leader>m :make<CR>

" Copy to global clipboard not just yank into buffer
let s:os = substitute(system('uname'), "\n", "", "")
if "Linux" == s:os
	map <Leader>y "*y
elseif "Darwin" == s:os
	map <Leader>y "+y
endif

" Sane (Bash-like) filename completion style
set wildmode=longest:full
set wildmenu

" Turn off reindenting on typing closing parens, brackets and curlies
" Erlang default is:        indentkeys=0{,0},:,0#,!^F,o,O,e,=after,=end,=catch,=),=],=}
autocmd FileType erlang set indentkeys=0{,0},0#,!^F,o,O,e,=after,=end,=catch
" Python default is:        indentkeys=0{,0},:,!^F,o,O,e,<:>,=elif,=except
autocmd FileType python set indentkeys=0{,0},!^F,o,O,e,=elif,=except

" Default indentation rules
se sts=4 sw=4 ts=4 et

" Use per project .vimrc and make it secure
set exrc
set secure
