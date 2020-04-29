call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}        " auto completions
    Plug 'ctrlpvim/ctrlp.vim'                              " fuzzy finder
    Plug 'scrooloose/nerdcommenter'                        " CMD + / to comment stuff out
    Plug 'scrooloose/nerdtree'                             " file explorer tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'         " highlighting for the tree
    Plug 'morhetz/gruvbox'                                 " theme
    Plug 'HerringtonDarkholme/yats.vim'                    " TS Syntax
call plug#end()


let g:loaded_python_provider  = ''
let g:loaded_ruby_providder   = 0
let g:NERDTreeIgnore = ['^node_modules$']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


set expandtab                                               " convert spaces to tabs
set tabstop=4                                               " amount of spaces
set shiftwidth=4                                            " amount of spaces
set hidden                                                  " TextEdit might fail hidden is not set
set nobackup                                                " some servers have issues with backup files
set nowritebackup                                           " some servers have issues with backup files
set cmdheight=2                                             " gives more height for displaying messages
set updatetime=300                                          " default is 4s, needs to be up to improve UX
set shortmess+=c                                            " don't give ins-completion-menu messages.
set signcolumn=yes                                          " enabled to prevent jumpy UI
set termguicolors                                           " required for vim in terminal

colorscheme gruvbox


" iTerm2 keybinding remapped so that (CMD + /) sends ++
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" iTerm2 sends a hex code to trigger (CMD + n)

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" use `u` to undo, use `U` to redon
nnoremap U <C-r>


" use tab and shift tab to indent and de-indent code
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv


" when pairing some braces or quotes, put cursor between them
inoremap <>   <><Left>
inoremap ()   ()<Left>
inoremap {}   {}<Left>
inoremap []   []<Left>
inoremap ""   ""<Left>
inoremap ''   ''<Left>
inoremap ``   ``<Left>


let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]


" Use CMD + d to jump to next match just like good ol' VSCode
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight') 

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

