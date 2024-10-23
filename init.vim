lua require('base')

set number relativenumber
set nocompatible
set fillchars=eob:- 

"highlight Normal guibg=#1a1b26
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE

call plug#begin('~/.config/nvim/plugged')
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier'
Plug 'joshdick/onedark.vim'
"Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'neoclide/coc-snippets'
Plug 'Exafunction/codeium.vim'
"Plug 'codota/tabnine-vim'
"Plug 'github/copilot.vim'
"Plug 'SirVer/ultisnips'
"Plug 'mlaursen/vim-react-snippets'
"Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF
require('lualine').setup({
  options = {
    theme = 'solarized',  -- ใช้ธีม Solarized ใน Lualine
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
})
EOF



syntax on
colorscheme solarized
highlight Normal guibg=#00000000
let g:lightline = { 'colorscheme': 'solarized' }
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
"let g:user_emmet_mode='n'
"let g:user_emmet_mode='inv'
"let g:user_emmet_leader_key=','

autocmd FileType html,css,svelte,vue,javascript,jsx EmmetInstall
"autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
"autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

"autocmd FileType javascriptreact,typescriptreact

"
"UltiSnipsAddFiletypes javascript,javascriptreact
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let mapleader=" "
noremap <Leader>q :q
noremap <Leader>Q :q!
noremap <Leader>w :w
noremap <Leader>x :wq

inoremap jk <Esc>



" Emmet settings
let g:user_emmet_mode='a'    " เปิดใช้งานในทุก modes
let g:user_emmet_leader_key='<C-Z>'  " ใช้ Ctrl+Z เป็น leader key แทน

" COC settings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Emmet expand with Tab key (only in insert mode)
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")





