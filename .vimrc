" source junas
source ~/.vim/junas

" install whatever bundles over the net
silent call Bundle(["xoria256", "vim-colors-solarized"])
silent call Bundle(["surround", "repeat", "Rainbow_Parenthesis", "matchit.zip", "eregex"])
silent call Bundle(["The_NERD_tree", "The_NERD_Commenter", "powerline"])

" use the xoria256 color scheme
colorscheme xoria256

" more bundles
silent call Bundle(["fugitive", "git.zip", "Gist",  "cucumber.zip", "rake"])
silent call Bundle(["haml.zip", "Better_Javascript_Indentation", "Textile_for_VIM", "vim-coffee-script", "vim-ruby"])
silent call Bundle(["vim-pasta"])
silent call Bundle(["vimpager"])

" override xoria colors
hi Folded  ctermfg=180 guifg=#dfaf87 ctermbg=234 guibg=#1c1c1c
hi NonText ctermfg=252 guifg=#d0d0d0 ctermbg=234 guibg=#1c1c1c cterm=none gui=none

" map whatever key to leader
let mapleader = ","

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

set nobackup
set noswapfile

set diffopt+=iwhite
set diffexpr="-w -b -B"

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

" toggle reference file
nnoremap <F1> :call ToggleVimReference()<CR>

let g:vim_reference_file = "~/Dropbox/reference.txt"
let g:vim_reference_width = 45

""" FocusMode from http://paulrouget.com/e/vimdarkroom/
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    set cmdheight=1
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    set cmdheight=3
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F2> :call ToggleFocusMode()<cr>


""" simple vim window management from http://www.agillo.net/simple-vim-window-management/
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

map <leader>wc :wincmd q<cr>
map <leader>wr <C-W>r

map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

""" make Y behave like other capitals from vimbits
map Y y$

""" use sudo to write files from vimbits
cmap w!! %!sudo tee > /dev/null %

""" tabs, windows, buffers
map t :tabnew 
map K gt<CR>  # next tab
map J gT<CR>  # previous tab
