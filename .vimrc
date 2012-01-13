" source junas
source ~/.vim/junas

" install whatever bundles over the net
silent call Bundle(["The_NERD_tree", "The_NERD_Commenter", "powerline"])
silent call Bundle(["surround", "repeat", "Rainbow_Parenthesis", "matchit.zip", "eregex"])
silent call Bundle(["fugitive", "git.zip", "Gist",  "cucumber.zip", "rake"])
silent call Bundle(["haml.zip", "Better_Javascript_Indentation", "Textile_for_VIM", "vim-coffee-script", "vim-ruby"])

" map whatever key to leader
let mapleader = ","

" use the xoria256 color scheme (included)
colorscheme xoria256

" and anything else you want to override or set

" settings
set pastetoggle=<F2>

set shiftround smarttab
set autoindent smartindent
set showmatch

set hidden
set nowrap
set nonumber

set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set t_vb=

set scrolloff=3
set nojoinspaces

set cmdheight=3

set nobackup
set noswapfile

set diffopt+=iwhite

set guioptions=

" strip whitespace from end of lines
"autocmd FileType javascript,ruby,eruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" these commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set foldmethod=syntax
set foldnestmax=3

set fillchars=vert:\|,fold:\ ,diff:-

" open/close folds with tab
map <TAB> za

set foldtext=MyFoldText()
function! MyFoldText()
  return getline(v:foldstart)
endfunction

" disable folding
set nofoldenable 

" always show ruby comments
let ruby_no_comment_fold=1

" fold by default in ruby
autocmd FileType ruby normal zM

