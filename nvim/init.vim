" Authors: Plato Kiorpelidis <otalpster@gmail.com>
" Description: A minimal, but feature rich, neovim config.

" ------------------------------------------------------------------------------
" Visual options:
" ------------------------------------------------------------------------------

" Show current line's number.
set number
" Show numbers relative to current line's number.
set relativenumber
" Show vertical lines after textwidth + 1.
"let &l:colorcolumn='+' . join(range(3, 254), ',+')
set colorcolumn=81
" Highlight current line.
"set cursorline
" Enable highligh search.
set hlsearch
" Show status line always.
set laststatus=2
" Don't show the line number, the column number, the virtual column number,
" and the relative position of the cursor in the file.
set noruler
" Don't show the current mode.
set noshowmode
" Enable list characters.
set list
set listchars+=trail:•
" Show tabs with a ▏ for indentation and tabstop - 1 tailing spaces.
set listchars+=tab:\\ 

" ------------------------------------------------------------------------------
" Usability options
" ------------------------------------------------------------------------------

" Allow switching between buffers w/o saving.
set hidden
" Render tabs with 4 width.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
" Each line holds 80 characters. Used for formating text with gq.
set textwidth=80
set formatoptions-=t
set formatoptions+=l
set formatoptions+=q
filetype plugin indent on
set autoindent
" Enable undofile.
set undofile
set undodir=$HOME/.config/nvim/undo
" Update screen faster (for git gutter).
set updatetime=250
" Ignore *.o files when searching for a file (using :e or Ctrl-P).
set wildignore=*.o
" Jump to matching paren/brackets etc when inserting closing one.
set showmatch
" Minimum number of screen lines to keep above and below the cursor.
"set scrolloff=5

" ------------------------------------------------------------------------------
" Mapping options
" ------------------------------------------------------------------------------

" Map leader key to space.
let mapleader=" "

" Cancel a search (remove highlighted results) with Escape.
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<LF>

" Switch to previous buffer.
nnoremap <Leader><Leader> :e#<LF>

" Make arrow keys useless for n,v,s,o.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Make arrow keys useless for i.
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Control-S Save in n.
nmap <C-s> :w<LF>
" Control-S Save in i.
imap <C-s> <C-o>:w<LF>

" Session management.
let g:sessions_dir="~/.config/nvim/sessions"
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Launch ack.vim with ctrl-f.
nmap <C-f> :Ack ''<LEFT>

" ------------------------------------------------------------------------------
" Vim-Plug
" ------------------------------------------------------------------------------

" Specify a directory for plugins.
call plug#begin('~/.config/nvim/plugged')

" Load autocompletion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Load fuzzy finder Ctrl-P.
Plug 'ctrlpvim/ctrlp.vim'

" Load git gutter.
Plug 'airblade/vim-gitgutter'

" Load git integration.
Plug 'tpope/vim-fugitive'

" Load nerdcommenter.
Plug 'scrooloose/nerdcommenter'

" Load colorscheme onedark (atom).
" Required by simpleline.vim statusline.
Plug 'joshdick/onedark.vim'

" Load statusline.
Plug 'otalpster/simpleline.vim'

" Load colorscheme gruvbox.
Plug 'morhetz/gruvbox'

" Load ack frontend for vim.
Plug 'mileszs/ack.vim'

call plug#end()

" Enable syntax highlighting.
syntax on

" Use 24-bit color and highlight-guifg highlight-guibg attributes.
set termguicolors

" ------------------------------------------------------------------------------
" Plug-in config
" ------------------------------------------------------------------------------

" Some useful mappings for ack.vim.
"
" j: move to the next result in list and preview it.
" k: move to the previous result in list and preview it.
let g:ack_mappings = {
	\ "j": "j<CR><C-W>p",
	\ "k": "k<CR><C-W>p" }

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_number_column="dark0"
set background=dark
colorscheme gruvbox
