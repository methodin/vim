filetype off
call pathogen#infect()
call pathogen#helptags()

syntax enable
filetype on
set t_Co=256
set background=dark
colors tir_black 
"colors desert, herald, molokai
"calmar.vim  desert.vim  herald.vim  inkpot.vim  ir_black.vim  jellybeans.vim  molokai.vim  moria.vim  mustang.vim  solarized.vim  wombat.vim  zmrok.vim

highlight TODO ctermbg=red ctermfg=white guibg=#592929
match TODO /\/\/ ?TODO.*/

highlight LineNr ctermfg=238 ctermbg=233

hi User1 ctermbg=255 ctermfg=green 
hi User2 ctermbg=236   ctermfg=red
hi User3 ctermbg=blue  ctermfg=green
  
set statusline=
set statusline+=%1*  "switch to User1 highlight

set cursorline

hi StatusLine guifg=#CCCCCC guibg=#202020 gui=italic ctermfg=235 ctermbg=254
hi StatusLineNC guifg=black guibg=#202020 ctermfg=0 ctermbg=235 
hi MBENormal ctermbg=235 ctermfg=248
hi MBEVisibleNormal ctermbg=235 ctermfg=46
hi MBEChanged ctermbg=235 ctermfg=208
hi MBEVisibleChanged ctermbg=235 ctermfg=46


" Map ctrl-r to replace in visual mode
nnoremap <F3> :let @/ = ""<CR>
nnoremap <F2> :set nonumber!<CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
noremap ;; :%s:::g<Left><Left><Left>
inoremap jj <Esc>
nmap ,rr :call ReloadAllSnippets()<CR>

map ,e :s/=> \([^,]*\),/=> !empty(\1) ? \1 : '',/g<CR>:noh<CR>

" MINIBUFFER
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
set hid

au BufNewFile,BufRead *.ctp set filetype=xml
au BufNewFile,BufRead *.twig set filetype=html

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

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

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set shiftwidth=2
set tabstop=2
set expandtab


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


"------------------------------------------------------------

hi SignColumn ctermbg=232 guibg=#080808

" Set directory for swap files
set directory=~/.vim/swap,.

" Relative number switch
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

