"===================================================================================
" GENERAL SETTINGS
"===================================================================================

"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible
"
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on
"
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on            
"
" Central backup directory (has to be created)
set backupdir =$HOME/.vim.bkupdir
"
" Using a backupdir under UNIX/Linux: you may want to include a line similar to
"   find  $HOME/.vim.backupdir -name "*" -type f -mtime +60 -exec rm -f {} \;
" in one of your shell startup files (e.g. $HOME/.profile)
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set mouse=a                     " enable the use of the mouse
set noexpandtab                " use tabse, not spaces
set nu						   " show line numbers
set shiftwidth=2                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smarttab                   " make <tab> and <backspace> smarter
set tabstop=2                   " number of spaces that a <Tab> counts for
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set showmatch
set mat=2
"set autoindent smartindent     " turn on auto/smart indenting
set ai
set si
set wrap


"
"===================================================================================
" BUFFERS, WINDOWS
"===================================================================================
"
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
"
"-------------------------------------------------------------------------------
" close window (conflicts with the KDE setting for calling the process manager)
"-------------------------------------------------------------------------------
 noremap  <C-Esc>       :close<CR>
inoremap  <C-Esc>  <C-C>:close<CR>
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
 noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nnoremap  <C-q>    :wqall<CR>
"
"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif " has("autocmd")
"
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error   
"-------------------------------------------------------------------------------
"
map   <silent> <F2>        :write<CR>
map   <silent> <F3>        :Explore<CR>
nmap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>        :copen<CR>
map   <silent> <F6>        :cclose<CR>
map   <silent> <F7>        :cp<CR>
map   <silent> <F8>        :cn<CR>
"
imap  <silent> <F2>   <Esc>:write<CR>
imap  <silent> <F3>   <Esc>:Explore<CR>
imap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>   <Esc>:copen<CR>
imap  <silent> <F6>   <Esc>:cclose<CR>
imap  <silent> <F7>   <Esc>:cp<CR>
imap  <silent> <F8>   <Esc>:cn<CR>
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
"
 map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q : Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nmap  <C-q>    :wqa<CR>
"
"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>
"
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%
"
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
" xnoremap  '  s''<Esc>P<Right>
" xnoremap  "  s""<Esc>P<Right>
" xnoremap  `  s``<Esc>P<Right>
"
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")

let b:verilog_indent_modules = 1

set wildmenu
set wildmode=list:longest,full

colorscheme desert
set background=dark

map j gi
map k gk

nnoremap <C-t>  :set invpaste paste?<CR>
set pastetoggle=<C-t>
set showmode
