" Authors: Plato Kiorpelidis <otalpster@protonmail.com>
" Description: A minimal, but feature rich, personal init.vim.

" -------------------------------------------------------------------
" Visual options:
" -------------------------------------------------------------------

" Use line numbering.
set number

" Use relative numbering.
"set relativenumber

" Add a colored column at 80 to avoid going to far to the right.
" Colorscheme otalpster uses colorcolumn.
set colorcolumn=81

" When running a search, get Nvim to highlight found words.
set hlsearch

" Always display the status line, even if one window is displayed.
set laststatus=2

" Display the cursor position on the last line of the screen or
"in the status line of a window.
set ruler

" Set the command window height to 2 lines, to avoid many
"cases of having to press <Enter> to continue.
set cmdheight=2

" Do not show the current mode.
set noshowmode

" Enable listchars.
"set list

" Set the invinsibles.
"set listchars+=tab:\ \
"set listchars+=nbsp:␣
"set listchars+=trail:•
"set listchars+=extends:⟩
"set listchars+=precedes:⟨
"set listchars+=eol:¬

" -------------------------------------------------------------------
" Usability options:
" -------------------------------------------------------------------

" Vim with default settings does not allow easy switching between
" multiple files in the same editor window. Users can use multiple
" split windows or multiple tab pages to edit multiple files, but it
" is still best to enable an option to allow easier switching between
" files.
"
" One such option is the 'hidden' option, which allows you to re-use
" the same window and switch from an unsaved buffer without saving it
" first. Also allows you to keep an undo history for multiple files
" when re-using the same window in this way. Note that using
" persistent undo also lets you undo in multiple files even in the
" same window, but is less efficient and is actually designed for
" keeping undo history after closing Vim entirely. Vim will complain
" if you try to quit without saving, and swap files will keep you
" safe if your computer crashes.
set hidden

" This setting tells NVim to insert spaces when the tab key is pressed.
set expandtab

" This setting tells Vim how many columns a tab should be made up
"of in the editor view, it takes care only of how tabs will be
"rendered and has no effect on the actual text.
set tabstop=4

" Set a value for this option to control how many columns text will
"be indented when using indent operations (such as << or >>)
"in normal or visual mode.
set shiftwidth=4

" That will automatically wrap text as close to 79 characters as
"white space allows without exceeding the 79 character limit.
"This option wraps at word boundaries
set textwidth=80

" Wrapping text using textwidth requires "t" in formatoptions, which
"it is by default. The following command add "t". The abbreviation
"fo can be used instead of formatoptions.
set formatoptions+=t

" If a line is already longer than textwidth when insert mode is
"started, the line may not be wrapped even if text is added to the
"line. A long line is not wrapped when text is added if formatoptions
"contains "l". If needed, "l" can be removed so long lines will be
"wrapped.
set formatoptions-=l

" Instead of failing a command because of unsaved changes, instead
"raise a dialogue asking if you wish to save changed files.
set confirm

" Tries to understand what kind of file it is and enables
" filetype-specific indenting.
filetype indent on

" When opening a new line and no filetype-specific indenting
"is enabled, keep the same indent as the line you're currently on.
set autoindent

" Save undos after the file closes.
set undofile

" Where to save the undo histories.
set undodir=$HOME/.config/nvim/undo

" Set working directory to be the same as the file your are editing.
"set autochdir

" Update things like git-gutter faster.
set updatetime=250

" Ignore *.o files when completing, searching, etc.
set wildignore+=*.o

" -------------------------------------------------------------------
" Mapping options:
" -------------------------------------------------------------------

" Use a Leader key.
let mapleader=" "

" Cancel a search (remove highlighted results) with Escape.
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<LF>

" Re-open previously open file.
nnoremap <Leader><Leader> :e#<LF>

" Open NERDTree at current file.
map <C-\> :NERDTreeFind<LF>

" Make arrow keys useless.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" -------------------------------------------------------------------
" Nvim plug:
" -------------------------------------------------------------------

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Load auto-pairs.
Plug 'jiangmiao/auto-pairs'

" Load ctrl-p.
Plug 'ctrlpvim/ctrlp.vim'

" Load syntastic (syntax checker).
Plug 'vim-syntastic/syntastic'

" Load git gutter.
Plug 'airblade/vim-gitgutter'

" Load language pack colorscheme.
Plug 'sheerun/vim-polyglot'

" Load file tree.
Plug 'scrooloose/nerdtree'

" Load snippets.
Plug 'SirVer/ultisnips'

" Load airline.
Plug 'vim-airline/vim-airline'

" Load git integration.
Plug 'tpope/vim-fugitive'

" Load colorschemes.
Plug 'ayu-theme/ayu-vim'

" Load indent lines.
Plug 'Yggdroot/indentLine'

" Load NERDTree git gutter.
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'dhruvasagar/vim-table-mode'

" Load LaTeX support.
Plug 'lervag/vimtex'

" Initialize plugin system.
call plug#end()

" -------------------------------------------------------------------
"  Plugin config:
" -------------------------------------------------------------------

"" Ultisnips.
" Set triggers.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Set directory to search snippets.
let g:UltiSnipsSnippetDirectories=['mysnips']

"" IndentLine.
" Set indent character.
let g:indentLine_char = ''
" Set indent character for the first level.
let g:indentLine_first_char = ''
" Enable indent characters for first level indentation.
let g:indentLine_showFirstIndentLevel = 1
" TODO: Learn what this option does.
let g:indentLine_setColors = 0

"" Airline.
" Enable powerline glyphs for airline.
let g:airline_powerline_fonts = 1
" Enable tabline.
let g:airline#extensions#tabline#enabled = 1
" Set the tabline file path format.
let g:airline#extensions#tabline#formatter = 'unique_tail'

"" NERDTree.
" Set directory symbols.
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" Enable minimal UI.
let NERDTreeMinimalUI = 1
" Close when opening a file.
let NERDTreeQuitOnOpen = 1
" Automatically delete the buffer of the file you just deleted.
let NERDTreeAutoDeleteBuffer = 1
" Close nvim if the only window left open is NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -------------------------------------------------------------------
" Graphic options:
" -------------------------------------------------------------------

" Use syntax i.e.: bold/italic/colored letters.
syntax on

" Use true colors in the terminal.
set termguicolors

let ayucolor="dark"   " for dark version of theme
colorscheme ayu

set encoding=utf-8
set fileencoding=utf-8
