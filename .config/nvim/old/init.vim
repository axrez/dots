syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set clipboard=unnamed
set clipboard=unnamedplus


call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'takac/vim-hardtime'
call plug#end()

colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
highlight LineNr ctermfg=white ctermbg=NONE

let mapleader = " "

let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Enable keybindings for coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Fugitive remaps
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

nnoremap <leader>ga :Git fetch<CR>

" 'edit alternate file' convenience mapping
nnoremap <leader><leader> <C-^>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" coc keybinds end

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Setup prettier dommand
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Setup fzf
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>j <cmd>Telescope git_files<CR>
nnoremap <Leader>pf <cmd>Telescope find_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>u :UndotreeShow<CR>

map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Setup floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.95
let g:floaterm_height=0.95
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

nnoremap <C-j> :FloatermToggle<CR>
tnoremap <C-j> <C-\><C-n> :FloatermToggle<CR>

" Allow exit from terminal on danish keyboard -.-
tnoremap <C-f> <C-\><C-n>
nnoremap <leader>t :FloatermNew --wintype=vsplit --width=0.35<CR>
nnoremap <leader>gg :FloatermNew --autoclose=2 lazygit<CR>
nnoremap <leader>rwr :FloatermNew --wintype=vsplit --width=0.35 cargo watch -x check -x run<CR>
nnoremap <leader>rwc :FloatermNew --wintype=vsplit --width=0.35 cargo watch -x check<CR>
nnoremap <leader>rwt :FloatermNew --wintype=vsplit --width=0.35 cargo watch -x check -x test<CR>

" Setup nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <leader>c :bd<CR>
nnoremap <leader>C :bufdo bwipeout<CR>


