runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
filetype plugin indent on
syntax on

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"space as leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

"comma as localleader key
let maplocalleader="\<Space>"

"enable project-specific .vimrc files
set exrc

"use system clipboard
set clipboard=unnamed

"line numbers
set number

"lines no longer than 80 chars
set textwidth=80

"indent tab width stuff
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

"folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"disable arrowkeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"history scrolling
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"sane way to navigate through windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"shortcut for saving file
nnoremap <leader>w :w<CR>

"shortcuts for opening files from the same dir as current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

"" themes and statuline
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

set laststatus=2
let g:lightline = {}
let g:lightline.colorscheme='gruvbox'

"" tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

""golang
"jump between errors
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
"use goimports instead of gofmt
let g:go_fmt_command = "goimports"

silent! so .vimlocal

"disable unsafe commands for project-specific .vimrc files
set secure
