set nocompatible                  " Must come first because it changes other options.

" setup Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"----------------------------------------------------------
" PLUGINS
"----------------------------------------------------------

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle "Command-T"

" javascript indentation in vim sucks
Bundle 'Better-Javascript-Indentation'

" JSON.vim - JSON syntax highlighting
Bundle 'JSON.vim'

" LustyJuggler - switch between buffers easier
Bundle 'LustyJuggler'

" NerdCommenter - comment blocks of code
Bundle 'The-NERD-Commenter'

" NerdTree - displays a neat file explorer window
Bundle 'The-NERD-tree'

" YankRing - when pasting use C-N and C-P to toggle between registers
Bundle 'YankRing.vim'

" ack - use ack to search through files
Bundle 'ack.vim'

" FuzzyFinder
Bundle 'FuzzyFinder'

" csapprox - make gvim colorschemes work in console
" Bundle 'CSApprox'

" d.vim - syntax highliting for D programming language
Bundle 'd.vim'

" delimitMate - autoclosing of (", etc. that does not clash with endwise
Bundle 'delimitMate.vim'

" greplace.vim - plugin that allows search and replace across all of the project files
Bundle 'greplace.vim'

" syntastic - plugin for displaying syntax errors
Bundle 'Syntastic'

" No longer count letters or words when jumping
Bundle 'Lokaltog/vim-easymotion'

" vim-endwise - wisely add 'end' in ruby
Bundle 'endwise.vim'

" vim-fugitive - vim-git integration
Bundle 'fugitive.vim'

" vim-git - a couple more basic commands to work with git
Bundle 'tpope/vim-git'

" vim-markdown - syntax highlighting for markdown
Bundle 'Markdown'

" vim-matchit - better pair matching for the % command
Bundle 'matchit.zip'

" vim-ragtag - enables some keyboard shortcuts for working with HTML, ERB, etc.
Bundle 'ragtag.vim'

" vim-rake - :Rake, :A, :R like in rails.vim, but without rails
Bundle 'tpope/vim-rake'

" vim-rails - awesome vim-rails integration
Bundle 'rails.vim'

" vim-repeat - repeat comnmands from plugins using .
Bundle 'repeat.vim'

" vim-ruby - ruby integration
Bundle 'ruby.vim'

" vim-ruby-refactoring - automatic refactorings for ruby
Bundle 'ecomba/vim-ruby-refactoring'

" vim-surround - surrounding text with braces, quotes, html tags...
Bundle 'surround.vim'

" vim-textobj - dependency of rubyblock
Bundle 'textobj-user'

" vim-textobj-rubyblock - allow selecting blocks in ruby as text objects
Bundle 'textobj-rubyblock'

" Convert Ruby blocks between {} and begin/end
Bundle "git://github.com/bronson/vim-ruby-block-conv.git"

" vim-unimpaired - some useful mappings, for example to swap code lines
Bundle 'unimpaired.vim'

" vim-zoomwin - when maximizing the window it is possible to un-maximize it
Bundle 'ZoomWin'

" zencoding-vim - plugin for expanding css-like syntax to html
Bundle 'ZenCoding.vim'

" Support for CoffeeScript syntax
Bundle 'git://github.com/kchmck/vim-coffee-script.git'

" The :Bclose command deletes a buffer without changing the window layout,
" see: http://vim.wikia.com/wiki/VimTip165
Bundle "git://github.com/rwfitzge/vim-bclose.git"

" Delete all the buffers except the current/named buffer
Bundle "BufOnly.vim"

" Vim Cucumber runtime files
Bundle 'cucumber.zip'

" Plugin for selecting ruby blocks
Bundle 'textobj-rubyblock'

"----------------------------------------------------------

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
filetype plugin on

runtime macros/matchit.vim        " Load the matchit plugin.

set encoding=utf-8                " Default encoding

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight the current line

set history=1000                  " remember more commands and search history
set undolevels=1000               " use many muchos levels of undo

set virtualedit=block             " allow the cursor to go into invalid places only in visual block mode

" Display tabs and trailing spaces
set list
set listchars=tab:»\ ,trail:·,nbsp:·

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set splitbelow splitright         " Splitting behavior

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
set laststatus=2                  " Show the status line all the time

set confirm                       " confirm on quit, etc.
set autoread                      " automatically read changes from disk

set diffopt+=iwhite               " ignore whitespace in vimdiff

" Folding settings
set foldmethod=indent             " indent based on syntax
set foldnestmax=3                 " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                  " dont fold by default

set matchpairs+=<:>               " add < and > to the chars thac can be navigated with %

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" change the mapleader from \ to ,
let mapleader=","

" j and k will navigate correctly in the wrapped lines
nnoremap j gj
nnoremap k gk

" map .md files fo markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.coffee set filetype=coffee

" automatically strip trailing whitespace for some file types
autocmd FileType c,cpp,java,php,javascript,coffee,html,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

au! BufRead,BufNewFile *.json setfiletype json
autocmd FileType json set equalprg=json_reformat

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if (&term == "linux")
  let g:CSApprox_loaded = 1
else
  " Colors for console
  if !has("gui_running")
    set t_Co=256
  endif

  " Scheme
  colors railscasts
endif

" set some different setting for the diff mode
if &diff
  colorscheme fu_patched " different scheme
  set nonumber " no line numbers
endif

" NERDTree
let g:NERDChristmasTree = 1
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['eruby']

" zencoding-vim
let g:user_zen_expandabbr_key = '<c-e>' 
let g:use_zen_complete_tag = 1

" FuzzyFileFinder
map <silent> <F2> <ESC>:NERDTreeToggle<CR>
map <silent> <F3> <ESC>:CommandT<CR>
map <silent> <F4> <ESC>:CommandTBuffer<CR>

let g:fuf_file_exclude = 'vendor'

" define abbreviations for Rails
let g:fuf_abbrevMap = {
  \   "^m:": [
  \       "app/models/**/",
  \       "spec/models/**/"
  \   ],
  \   "^v:": [
  \       "app/views/**/",
  \       "spec/views/**/"
  \   ],
  \   "^c:" : [
  \       "app/controllers/**/",
  \       "spec/controllers/**/"
  \   ],
  \   "^s:" : [
  \       "spec/**/"
  \   ]
  \ }

map <F5> :bprevious<CR> " map F5 to open previous buffer
map <F6> :bnext<CR>     " map F6 to open next buffer
map <F7> :Bclose<CR>    " map F6 to close the current buffer

" a key mapping for running tests
nmap <silent> <leader>r :Rake<cr>
nmap <silent> <leader>rs :Rake spec<cr>

" regenarate tags and reload the list of files used by Command-T plugin
nmap <silent> <leader>g :CommandT<cr>
nmap <silent> <leader>G :CommandTFlush<cr>:Rtags<cr>

" ignore gems bundled in the project directory
set wildignore+=vendor/gems,vendor/bundle

cmap w!! w !sudo tee % >/dev/null " w!! lets you save files that you would have to use sudo vim to open

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" some plugin was overriding the redo command
nmap <silent> <C-r> :redo<cr>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Toggle comment
nmap <C-\> ,ci
vmap <C-\> ,ci

" Netbeans style buffer completion
imap <C-k> <C-n>

" Netbeans style duplicate lines
map <M-Up> <Esc>YP
imap <M-Up> <Esc>YPi
map <M-Down> <Esc>Yp
imap <M-Down> <Esc>Ypi

map <C-s> <Esc>:w<CR>

if has("gui_running")
  set guifont=Inconsolata\ 15
endif
