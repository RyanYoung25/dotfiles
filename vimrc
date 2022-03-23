" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:

" Better file browser
Bundle 'scrooloose/nerdtree'
" Airline
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
" Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
" Bundle 'rosenfeld/conque-term'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
" Bundle 'michaeljsmith/vim-indent-object'
" LaTeX plugin
Bundle 'vim-latex/vim-latex'

"Base 16 colorscheme
Plugin 'chriskempson/base16-vim'
"Vim Minimap
Plugin 'severin-lemaignan/vim-minimap'
"Vim Svn Gutter
"#Bundle 'vim-scripts/vim-svngutter'
"YouCompleteMe plugin
"Bundle 'Valloric/YouCompleteMe'
" Better syntax highlighting
"Bundle 'scrooloose/syntastic'
"Taglist.vim A better source code browser
Bundle 'vim-scripts/taglist.vim'
" ML based auto complete
Plugin 'zxqfl/tabnine-vim'
" Minibuf explorer
Plugin 'fholgado/minibufexpl.vim'
" ALE real time linting - Need vim 8 :( 
Plugin 'dense-analysis/ale'
"
" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"filetype off                  " required

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
"set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=50
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab


" Tabbing setup 
set sw=4
set sts=4
set ts=4
set expandtab
set smarttab
set nolisp
set autoindent
set smartindent
set cindent
set modeline

" set indentkeys=!!^F,o,O,<:>,0),0],0},=elif,=except

" g0: Left-align scope labels (public, etc) in C++
" (0: Line up first non-whitespace char after the unclosed ( on prev. line
" u0: Same, for one level deeper
" U1: Don't ignore the two options above
" w0: Really don't ignore (0 and u0 (line up w/ first
"     non-whitespace char after '(')
" Ws: OK to ignore on really long lines
" t0: Don't indent function return types
" +0: Don't add indent to a continuation line (this is the only way I've found
"     to prevent an extra indent between a function return type and the
"     function name(and parameters)
set cino=g0,(0,u0,U1,w0,Ws,t0,+0
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map ctrl-nav letters to move between splits
map <C-J> <C-W>j 
map <C-K> <C-W>k 
map <C-H> <C-W>h 
map <C-L> <C-W>l 

"Make it so \vs will vertically split the buffer you're on such that 
" the other buffer will be a continuation and follow scrolling
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"------------------------------------------------------------
"
"Plugin settings

" toggle nerdtree display
map <F4> :NERDTreeToggle<CR>
" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'distinguished'
let g:airline_theme = 'base16'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" Taglist
map tl :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
"base16 color settings
let base16colorspace=256
"------------------------------------------------------------
"
"Custom settings
set t_Co=256
highlight Normal ctermfg=grey ctermbg=black
colorscheme base16-3024
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" tab navigation mappings
" USE BUFFERS, they're more correct
map tn :bnext<CR>
map tp :bprevious<CR>
map tm :tabm 
map tt :edit 
map ts :tab split<CR>
map td :bdelete<CR>

" Visual mode searching 
vnoremap // y/<C-R>"<CR>

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

"
"
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" minibufexplorer settings
let g:miniBufExplMapWindowNavArrows = 1 " Ctrl+arrow changes window
let g:miniBufExplMapCTabSwitchBufs = 1  " Ctrl-[S-]Tab changes buffer
let g:miniBufExplSplitBelow = 1      " at the bottom / right
let g:miniBufExplSplitToEdge = 0     " but not above taglist
let g:miniBufExplModSelTarget = 1    " do not open files in taglist window
let g:miniBufExplVSplit = 20         " make it vertical
let g:miniBufExplorerMoreThanOne =99 " do not open automatically
let g:miniBufExplUseSingleClick = 1  " no need to double-click
let g:miniBufExplorerAutoUpdate=0    " don't confuse FUF's idea of prev buffer
set hid              "Hide abandoned buffers in order not to loose undo history

map bl :MBEToggleAll<CR>


" Create a line at 80 chars so I don't write really long lines
set colorcolumn=80 
" Spell check!
" Use ]s to go to the next misspelled word or [s to go back one
" Use z= to get spelling suggestions
set spelllang=en_us
map <F2> :setlocal spell<CR>
map <F3> :setlocal nospell<CR>

" Function and mapping for tab complete
"function! Tab_Or_Complete()
"    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"        return "\<C-N>"
"    else
"        return "\<Tab>"
"    endif 
"endfunction
"inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words" 
