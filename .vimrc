".
"' Use Vundle!
"

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Let's try the new version - disable this line for now.
"Bundle 'hcs42/vim-erlang'

"Bundle 'autozimu/LanguageClient-neovim'
"Bundle 'neomake/neomake'

"Bundle 'Valloric/YouCompleteMe'
"Bundle 'craigemery/vim-autotag'
"Bundle 'ervandew/taglisttoo'
"Bundle 'hallettj/jslint.vim'
"Bundle 'ludovicchabant/vim-gutentags'
"Bundle 'ppikula/vim-wrangler'
"Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-sleuth'
"Bundle 'vim-erlang/vim-erlang-runtime'
"Bundle 'vim-scripts/neocomplcache'
"Bundle 'vim-scripts/taglist.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'bkad/CamelCaseMotion'
Bundle 'cespare/vim-toml'
Bundle 'dart-lang/dart-vim-plugin'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'ervandew/supertab'
Bundle 'flazz/vim-colorschemes'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'lambdatoast/elm.vim'
Bundle 'mattn/emmet-vim'
Bundle 'neoclide/coc.nvim'
Bundle 'purescript-contrib/purescript-vim'
Bundle 'rust-lang/rust.vim'
Bundle 'sbdchd/neoformat'
Bundle 'scheakur/vim-scheakur'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'severin-lemaignan/vim-minimap'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/xterm16.vim'

filetype plugin indent on

".
"' Extra filetype support
"

" vala
autocmd BufRead *.vala setlocal efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi setlocal efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala setlocal filetype=vala
au BufRead,BufNewFile *.vapi setlocal filetype=vala

" ejabberd test.config and other Erlang-like filetypes
au BufRead,BufNewFile */ejabberd_tests/*.config setlocal filetype=erlang
au BufRead,BufNewFile */ejabberd_tests/*.spec setlocal filetype=erlang
au BufRead,BufNewFile escalus.config setlocal filetype=erlang
au BufRead,BufNewFile app.config,*.app.config,sys.config,*.sys.config setlocal filetype=erlang
au BufRead,BufNewFile rebar.config setlocal filetype=erlang
au BufRead,BufNewFile rebar.*.config setlocal filetype=erlang
au BufRead,BufNewFile reltool.config setlocal filetype=erlang
au BufRead,BufNewFile *.xrl setlocal filetype=erlang
au BufRead,BufNewFile *.yrl setlocal filetype=erlang

" Wrangler integration
let g:erlangRefactoring = 1
let g:erlangWranglerPath = '/Users/erszcz/work/wrangler'
nnoremap <leader>e :call ErlangExtractFunction("n")<ENTER>
vnoremap <leader>e :call ErlangExtractFunction("v")<ENTER>
noremap  <leader>m :call ErlangRenameModule()<ENTER>
noremap  <leader>f :call ErlangRenameFunction()<ENTER>
noremap  <leader>v :call ErlangRenameVariable()<ENTER>
noremap  <leader>p :call ErlangRenameProcess()<ENTER>
noremap  <leader>u :call ErlangUndo()<ENTER>

" tsung dumps
au BufRead,BufNewFile tsung.dump setlocal filetype=xml wrap

" ooc
au BufNewFile,BufRead *.ooc setlocal filetype=ooc

" Markdown instead of Modula
au BufNewFile,BufRead *.md setlocal filetype=markdown textwidth=74

" Treat Epistle files as Markdown by default
au BufNewFile,BufRead $HOME/Dropbox/epistle/*.txt setlocal filetype=markdown

" Vagrantfile is just ruby
au BufRead,BufNewFile Vagrantfile setlocal filetype=ruby

".
"' Predefined macros/variables
"

" reStructuredText/AsciiDoc header/title macro
let @h = "yypVr"

" ask about changing each Erlang string from here to the end of file
" to a binary
let @b = ':.,$s/\([^<]\{1,2\}\)"\(\S\{-\}\)"\([^>]\{1,2\}\)/\1<<"\2">>\3/gec'

" Personal information used in snippet expansion
let g:author	= 'Radosław Szymczyszyn'
let g:copyright	= 'Radosław Szymczyszyn'
let g:email_esl = 'radoslaw.szymczyszyn@erlang-solutions.com'
let g:email     = 'lavrin@gmail.com'

".
"' Customizations
"

" Disable cursor shape changing in NeoVim:
" prevent the cursor from changing to a vertical bar in insert mode
if has('nvim')
    set guicursor=
endif

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
" TODO: reenable when https://github.com/vim/vim/issues/2584 is gone
"set cursorline

" Wrap search past the end of document
set incsearch

" Highlight search results
set hlsearch

" Paste mode toggle
noremap <Leader>p :call TogglePasteMode()<CR>
set pastetoggle=<F11>p

let g:paste_mode = 0 " 0 = normal, 1 = paste

func! TogglePasteMode()
	if g:paste_mode == 0
		set paste
		let g:paste_mode = 1
		echo "Paste mode: on"
	else
		set nopaste
		let g:paste_mode = 0
		echo "Paste mode: off"
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

" Use :ln, :lp for navigating the location list
cabbr ln lnext
cabbr lp lprevious

" Display statusline no matter how many windows are open
set laststatus=2

" Statusline with filename, buffer info, ruler
set statusline=%<%f\ %h%m%r%q%=%-14.(%l,%c%V%)\ %P

" Fold column width
set foldcolumn=2

" Show ruler
set ruler

" Colorscheme selection
" TODO: check this out
"set termguicolors
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
if !has('nvim')
    set cryptmethod=blowfish
endif

" CtrlP: buffer list hotkey
noremap <Leader>b :CtrlPBuffer<cr>
" CtrlP: buffer's tags
noremap <Leader>tl :CtrlPBufTag<cr>
" CtrlP: tags for Elixir
let g:ctrlp_buftag_types = { 'elixir': '--language-force=elixir' }

" Make hotkey (good for markup previews)
noremap <Leader>m :make<CR>

" Copy to global clipboard not just yank into buffer
let s:os = substitute(system('uname'), "\n", "", "")
if "Linux" == s:os
	noremap <Leader>y "*y
elseif "Darwin" == s:os
	noremap <Leader>y "+y
endif

" Sane (Bash-like) filename completion style
set wildmode=list:longest
set wildmenu

" Turn off reindenting on typing closing parens, brackets and curlies
" Erlang default is:        indentkeys=0{,0},:,0#,!^F,o,O,e,=after,=end,=catch,=),=],=}
autocmd FileType erlang setlocal indentkeys=0{,0},0#,!^F,o,O,e,=after,=end,=catch
" Python default is:        indentkeys=0{,0},:,!^F,o,O,e,<:>,=elif,=except
autocmd FileType python setlocal indentkeys=0{,0},!^F,o,O,e,=elif,=except

" When editing markdown, treat : and - as parts of a word
" Default is:                 iskeyword=@,48-57,_,192-255,$,.
autocmd FileType markdown setlocal iskeyword=@,48-57,_,192-255,$,.,-,:

" HTML indentation rules
autocmd FileType html setlocal sts=2 sw=2 ts=2 et

" Default indentation rules
"se sts=4 sw=4 ts=4 et
set expandtab

" Use per project .vimrc and make it secure
set exrc
set secure

" Autosave session if it was intentioanlly loaded
function! AutoSaveSession()
  if exists("t:sessionfileloaded")
      call SaveSession()
  endif
endfunction

" Save session
function! SaveSession()
  let l:sessiondir = getcwd()
  let t:sessionfile = l:sessiondir . "/session.vim"
  if filewritable(l:sessiondir)
    exe "mksession! " . t:sessionfile
    echom "Session file " . t:sessionfile . " written."
  endif
endfunction

" Load session into the current tab
function! LoadSession()
  let t:sessionfile = getcwd() . "/session.vim"
  if filereadable(t:sessionfile)
    exe 'source ' t:sessionfile
    let t:sessionfileloaded = 1
  else
    echo "No session loaded."
  endif
endfunction

" Check whether there's a session in the current project directory
function! CheckForSession()
  let t:sessionfile = getcwd() . '/session.vim'
  if filereadable(t:sessionfile)
    echom "Session file " . t:sessionfile . " exists."
  endif
endfunction

nnoremap <Leader>s :call SaveSession()<CR>
nnoremap <Leader>l :call LoadSession()<CR>
au VimLeave * :call AutoSaveSession()
au VimEnter * :call CheckForSession()

" erlang: export type
nmap <Leader>e wwviwy0o-export_type([pa/0]).0

noremap <Leader>ev :split $MYVIMRC<CR>
noremap <Leader>sv :source $MYVIMRC<CR>

" make J join lines with a single space even on end of sentence / period character
set nojoinspaces

".
"' Plugin configuration
"

"" Neoformat - format on save
"augroup neoformat
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END

" LanguageClient
" Required for operations modifying multiple buffers like rename.
set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
let g:LanguageClient_serverCommands = {
    \ 'erlang': ['tcp://127.0.0.1:10000']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" YouCompleteMe configuration
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1

" syntastic - populate location list with errors
let g:syntastic_always_populate_loc_list=1

" SnipMate alternate keybinding
imap <C-\> <Plug>snipMateNextOrTrigger
smap <C-\> <Plug>snipMateNextOrTrigger

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
noremap <Leader>tl :TlistToggle<Return>
let g:tlist_markdown_settings = 'markdown;h:Contents;l:Links;x:Cross references;a:Anchors;d:Link definitions'

" surround: make b surround text with <<",">> in Erlang mode
autocmd FileType erlang let b:surround_98 = "<<\"\r\">>"
autocmd FileType erlang setlocal sw=4 ts=4 sts=4 et

" erlang/surround: make word an Erlang binary with one keybinding
nmap <Leader>B viwSb
vmap <Leader>B Sb

" Elm
"autocmd FileType elm setlocal sw=2 ts=2 sts=2 et

" autotag
" Installed from $HOME/work/lavrin/ctags / github.com/lavrin/ctags
let g:autotagCtagsCmd = "$HOME/apps/ctags/bin/ctags"

" Neomake
"autocmd! BufWritePost * Neomake
" Neomake: enable Erlang Gradualizer
let g:neomake_erlang_enabled_makers = ['erlc', 'gradualizer']
"let g:neomake_erlang_gradualizer_report_error_columns = 'true'
" override this one in a project-local .vimrc
"let g:neomake_erlang_gradualizer_extra_args = []
nnoremap <Leader>G :put =join(neomake#makers#ft#erlang#GradualizerArgs('.', neomake#makers#ft#erlang#EbinDirs( neomake#makers#ft#erlang#ProjectDir() ) ), ' ')

" CoC (for LSP support): disable underlining
highlight clear CocErrorHighlight
highlight clear CocWarningHighlight
highlight clear CocInfoHighlight
highlight clear CocHintHighlight

". vim: foldmethod=marker foldmarker="',".
