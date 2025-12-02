".
"' Use Vundle!
"

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'Valloric/YouCompleteMe'
"Bundle 'ashinkarov/nvim-agda'
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
Bundle 'chrisbra/unicode.vim'
Bundle 'dart-lang/dart-vim-plugin'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'ervandew/supertab'
Bundle 'flazz/vim-colorschemes'
Bundle 'folke/tokyonight.nvim'
Bundle 'garbas/vim-snipmate'
Bundle 'gbprod/yanky.nvim'
Bundle 'gleam-lang/gleam.vim'
Bundle 'hashivim/vim-terraform'
Bundle 'honza/vim-snippets'
Bundle 'hrsh7th/cmp-buffer'
Bundle 'hrsh7th/cmp-nvim-lsp'
Bundle 'hrsh7th/nvim-cmp'
Bundle 'isovector/cornelis'
Bundle 'kana/vim-textobj-user'
Bundle 'lambdatoast/elm.vim'
Bundle 'mattn/emmet-vim'
Bundle 'mfussenegger/nvim-fzy'
Bundle 'mfussenegger/nvim-qwahl'
Bundle 'mzlogin/vim-markdown-toc'
Bundle 'neovim/nvim-lspconfig'
Bundle 'neovimhaskell/nvim-hs.vim'
Bundle 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

if has('nvim')
Bundle 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Bundle "nvim-lua/plenary.nvim"
Bundle "elixir-tools/elixir-tools.nvim"
endif

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

" Erlang function spec
let @s = "0v$ÄklyIÄku-spec p"

" ask about changing each Erlang string from here to the end of file
" to a binary
let @b = ':.,$s/\([^<]\{1,2\}\)"\(\S\{-\}\)"\([^>]\{1,2\}\)/\1<<"\2">>\3/gec'

" Personal information used in snippet expansion
let g:author	= 'Rados≈Çaw Szymczyszyn'
let g:copyright	= 'Rados≈Çaw Szymczyszyn'
let g:email_esl = 'radoslaw.szymczyszyn@erlang-solutions.com'
let g:email     = 'lavrin@gmail.com'

".
"' Customizations
"

" Elixir autoformatting
augroup elixir
  autocmd!
  autocmd BufWritePost *.ex,*.exs call system('mix format') | edit
augroup END

" Custom digraph definitions
digraph ll 955  " GREEK SMALL LETTER LAMBDA
digraph NN 8469 " DOUBLE-STRUCK CAPITAL N for Naturals
digraph ~= 8771 " ASYMPTOTICALLY EQUAL TO
digraph ~< 8818 " LESS-THAN OR EQUIVALENT TO

" Disable cursor shape changing in NeoVim:
" prevent the cursor from changing to a vertical bar in insert mode
if has('nvim')
    set guicursor=
endif

" No Vi compatibility
set nocompatible

" Nice autocompletion - see nvim-cmp
"set ofu=syntaxcomplete#Complete
"set completeopt=longest,menuone

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
if has('nvim')
    colorscheme tokyonight
else
    " neovim 0.10+: this is necessary to be backwards compatible with old vim colorschemes
    set notermguicolors

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
endif

" Default encryption method
if !has('nvim')
    set cryptmethod=blowfish
endif

" fzy mappings
if has('nvim')
  lua << EOF
    fzy = require('fzy')
    local api = vim.api
    local ui = vim.ui

    -- Helper: parse buffer line to extract buffer number
    local function extract_bufnr(line)
      return tonumber(line:match('^%s*(%d+)%s'))
    end

    -- Main function: fuzzy select buffer from :ls t
    function FzySelectBuffer()
      -- Get the output of :ls t
      local lines = api.nvim_exec('ls t', true)
      local buf_lines = vim.split(lines, '\n')

      -- Use fzy to select
      local opts = {
        prompt = 'Buffer: ',
        format_item = function(i) return i end
      }
      vim.ui.select(buf_lines, opts, function(selected)
        if selected then
          local bufnr = extract_bufnr(selected)
          if bufnr then
            api.nvim_set_current_buf(bufnr)
          else
            print('Could not extract buffer number.')
          end
        end
      end)
    end

    -- Create command
    api.nvim_create_user_command('ErszczFzyBuffers', FzySelectBuffer, {})
EOF

  nnoremap <silent><leader>ff :lua fzy.execute('fd', fzy.sinks.edit_file)<CR>
  nnoremap <silent><leader>fg :lua fzy.execute('git ls-files', fzy.sinks.edit_file)<CR>
  nnoremap <silent><leader>fl :lua fzy.execute('rg --no-heading --trim -nH .', fzy.sinks.edit_live_grep)<CR>
  "nnoremap <silent><leader>fb :lua require('qwahl').buffers()<CR>
  nnoremap <silent><leader>fb :ErszczFzyBuffers<CR>
  nnoremap <silent><leader>ft :lua require('qwahl').lsp_tags()<CR>
endif

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

if has('nvim')
  lua << EOF

  vim.diagnostic.config({
    virtual_text = false
  })
EOF
endif

"" lsp_lines
if has('nvim')
  lua << EOF

  vim.diagnostic.config({virtual_lines = {only_current_line = false}})
  require("lsp_lines").setup({})
EOF
endif

"" nvim-treesitter - enable highlighting and indent for Elixir
if has('nvim')
  lua << EOF
  require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "elixir" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    -- List of parsers to ignore installing (or "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of languages that will be disabled
			--disable = { "c", "rust" },
			-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
			--disable = function(lang, buf)
			--    local max_filesize = 100 * 1024 -- 100 KB
			--    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			--    if ok and stats and stats.size > max_filesize then
			--        return true
			--    end
			--end,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false
    },
    indent = { enable = true }
  }
EOF
endif

"" yanky - yank-ring for NeoVim
if has('nvim')
  lua << EOF
  require("yanky").setup({
    ring = {
      history_length = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },
    system_clipboard = {
      sync_with_ring = true,
    },
  })

  vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
  vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
  vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
  vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

  vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
  vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
EOF
endif

"" Cornelis - agda-mode for NeoVim
let g:cornelis_use_global_binary = 1
let g:cornelis_split_location = 'bottom'
au BufRead,BufNewFile *.agda call AgdaFiletype()
function! AgdaFiletype()
    nnoremap <buffer> <leader>l :CornelisLoad<CR>
    nnoremap <buffer> <leader>r :CornelisRefine<CR>
    nnoremap <buffer> <leader>d :CornelisMakeCase<CR>
    nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
    nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
    nnoremap <buffer> <leader>n :CornelisSolve<CR>
    nnoremap <buffer> <leader>a :CornelisAuto<CR>
    nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
    nnoremap <buffer> [/        :CornelisPrevGoal<CR>
    nnoremap <buffer> ]/        :CornelisNextGoal<CR>
    nnoremap <buffer> <C-A>     :CornelisInc<CR>
    nnoremap <buffer> <C-X>     :CornelisDec<CR>
endfunction
au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"

function! CornelisLoadWrapper()
  if exists(":CornelisLoad") ==# 2
    CornelisLoad
  endif
endfunction

au BufReadPre *.agda call CornelisLoadWrapper()
au BufReadPre *.lagda* call CornelisLoadWrapper()


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

" nvim-lspconfig startup
if has('nvim')
  lua << EOF

  local lspconfig = require("lspconfig")
  local homedir = vim.loop.os_homedir()

  -- Enable Erlang Language Platform elp
  lspconfig.elp.setup({
    cmd = {"elp", "server"}
  })

  -- Enable ElixirLS via elixir-tools
  local elixir = require("elixir")
  local elixirls = require("elixir.elixirls")

  elixir.setup({
    nextls = {enable = false},
    projectionist = {enable = false},
    elixirls = {
      tag = "v0.30.0",
      settings = elixirls.settings {
        dialyzerEnabled = false,
        fetchDeps = true,
        enableTestLenses = false,
        suggestSpecs = true,
      },
    }
  })
EOF
endif
highlight LspDiagnosticsDefaultError ctermfg=grey
highlight LspDiagnosticsDefaultHint ctermfg=grey
highlight LspDiagnosticsDefaultInformation ctermfg=grey
highlight LspDiagnosticsDefaultWarning ctermfg=grey

" nvim-cmp: autocompletion
set completeopt=menu,menuone,noselect
if has('nvim')
  lua <<EOF
  -- Setup nvim-cmp
  local cmp = require 'cmp'

  cmp.setup({
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping({
       i = function(fallback)
         if cmp.visible() and cmp.get_active_entry() then
           cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
         else
           fallback()
         end
       end,
       s = cmp.mapping.confirm({ select = true }),
       c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
     }),
    },
    sources = {
      --{ name = 'nvim_lsp' },
      { name = 'buffer' },
    }
  })
EOF
endif

" supertab
let g:SuperTabCompleteCase='match'

". vim: foldmethod=marker foldmarker="',". ts=2 sts=2 sw=2 et
