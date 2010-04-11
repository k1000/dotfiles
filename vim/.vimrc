" general
"set cursorline
set nocompatible
set mouse=a
set ls=1 " always show status line
set showcmd " display incomplete commands
set showmode " display the current mode
set hlsearch " highlight searches
set incsearch " do incremental search
"set ruler " show the cursor position all the time
set visualbell t_vb= " turn off error beep/flash
set novisualbell " turn off visual bell
"set nobackup " do not keep a
set ch=2     " Make command line two lines highbackup file
set textwidth=78
syntax enable
filetype on
filetype plugin on
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set background=dark
colorscheme ir_black
set t_Co=256 " switch 256 colors

" autoclose
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "
inoremap ""     ""
" general tab, space settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

" Python autoindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" Python delete unnecessary whitespaces
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Omnicomplete
imap <C-Space> <C-x><C-o>
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" SnipMate
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.django_template

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1 " Focus on the taglist when its toggled
let Tlist_Use_Right_Window = 1 " Project uses the left window
let Tlist_File_Fold_Auto_Close = 1 " Close folds for inactive files
map <F4> :TlistToggle<CR>


" --------------- TABS --------------------
" show visible tab characters so we can see what we're doing
"set list
"set listchars=tab:  

" lock it down to 4 characters (your preference)
set ts=4 sw=4
set softtabstop=4
set noexpandtab

" when reading, retab with noexpandtab (literal tab characters)
auto BufReadPost *.xx set noexpandtab
auto BufReadPost *.xx retab!

" when writing, spit them out as spaces for the duration of the write
auto BufWritePre *.xx set expandtab
auto BufWritePre *.xx retab!

" then go back to blessed tabs.
auto BufWritePost *.xx set noexpandtab
auto BufWritePost *.xx retab!
