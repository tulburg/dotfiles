set encoding=UTF-8
set nocompatible
filetype plugin on
set path+=**
set wildmenu
set wildignore+=node_modules/**,.DS_Store,*.tmp,test.c
set guifont=Hasklug\ Nerd\ Font:h15
set autoread
set belloff=all
set guicursor+=a:blinkon0
"
" set paste
" set clipboard=unnamedplus
"--------------------------------- Neovide configurations
let g:neovide_opacity=0.96

let g:neovide_window_blurred=v:true
let g:neovide_window_shadow=v:true
" set paste
" set clipboard=unnamedplus
let g:neovide_cursor_animation_length = 0.100
let g:neovide_cursor_short_animation_length = 0.04
let g:neovide_input_use_logo=v:true

let g:neovide_floating_shadow = v:true
let g:neovide_floating_z_height = 10
let g:neovide_light_angle_degrees = 45
let g:neovide_light_radius = 10
let g:neovide_floating_corner_radius = 10.0
let g:neovide_floating_opacity=100
let g:neovide_show_border = v:true

set ignorecase
set smartcase
set termguicolors
set t_Co=256
set guicursor=n-v-c:block-blinkon0
hi Normal guibg=NONE ctermbg=NONE

set backupcopy=yes "Necessary for ParcelJS to work 

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
" Plug 'mattn/emmet-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/mru.vim'
Plug 'brooth/far.vim'
" Plug 'wincent/command-t', {'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'mtth/scratch.vim'
Plug 'jacoborus/tender.vim' 
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'wincent/ferret'

Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }
Plug 'rmagatti/auto-session'

call plug#end()

lua << EOF
require("auto-session").setup({
  auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
  auto_session_enabled = true,
  auto_session_suppress_dirs = { "~/", "/" },
})
EOF

set number
set splitright
set nowrap
set tabstop=2
set shiftwidth=2 softtabstop=2
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set fileencoding=utf-8
set signcolumn=yes
set noswapfile
set fillchars+=fold:· " for folds
set foldmethod=indent
set foldcolumn=1
let javaScript_fold=1
" set foldnestmax=99
set foldlevelstart=99
set title
set noerrorbells
set noreadonly
set backspace=indent,eol,start
" set autochdir
set scrolljump=3
set mouse=a
colorscheme tender


" --------------------------------------------------- Mappings
let mapleader = "\<Space>"
nnoremap <leader>rv :source $MYVIMRC<CR>

nnoremap <silent> <Leader>fm :CtrlPMRU<CR>
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"
nnoremap <silent> <Leader>t :bel term<CR><C-w>:horizontal resize -15<CR>
nnoremap <silent> <Leader>fg :!sublm search file:\"%\"<CR><CR>
function! GetVLines() 
	let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end]     = getpos("'>")[1:2]
	execute "!sublm search file:'\"%\"'line:" . line_start . "-" . line_end
endfunction
vnoremap <silent> <Leader>fg :call GetVLines()<CR>	
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>              "tabular
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>              "tabular
vnoremap <silent> <Leader>ce     :Tabularize /
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+1<CR>==
vnoremap ˚ :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv
inoremap ˚ :m '>+1<CR>gv=gv
inoremap ∆ :m '<-2<CR>gv=gv
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
vnoremap <C-l> <C-W><C-L>
vnoremap <C-h> <C-W><C-H>
nnoremap j <down>
nnoremap J 10<down>
nnoremap k <up>
nnoremap K 10<up>
nnoremap æ vi'
nnoremap Æ vi"
nnoremap " ci"
nnoremap ' ci'
nnoremap { diB
nnoremap ( dib

" nnoremap g '.
nnoremap G `.
nnoremap ` ``
" nnoremap g gg
nnoremap <C-R> :MRU<CR>
nnoremap <silent>q ?<C-r><C-w><CR>
nnoremap <silent>w /<C-r><C-w><CR>
nnoremap <silent>1 ^
vnoremap <silent>1 ^
nnoremap <silent>2 $
vnoremap <silent>2 $<left>
nnoremap <leader>r <C-r>
nnoremap <leader>u u
nnoremap <leader>d :t.<CR>j
nnoremap r <C-r>
vnoremap r <C-r>
nnoremap x dd
nnoremap dd yyp<CR>
vnoremap dd yyp<CR>
vnoremap <D-c> "+y  
nnoremap <D-v> "+gp
inoremap <D-v> <C-r>+
nnoremap <D-c> "+y

nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
nnoremap zx z1zO
nnoremap < :vertical resize -5<CR>
nnoremap > :vertical resize +5<CR> " Adjusts split width
vnoremap <C-r> "hy:%s/<C-r>h//gI<left><left><left>
nnoremap <leader>ms :vs<CR><C-W><C-H><C-o>
nnoremap <leader>r "hy:%s/<C-r><C-w>//gI<Left><Left><Left>"
" nnoremap <leader>s "hy:lvim /<C-r><C-w>/gj | lw
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>

nnoremap m mzJ`z
nnoremap M i<C-j><ESC>
" map { ?{<CR>
" map } /{<CR>
map dw diwi
" map ( ?(<CR>
" map ) /(<CR>
inoremap “ {<ESC><down>o}<ESC>O

command! -nargs=0 Reload :bufdo e
command! -nargs=0 T :terminal
command! Bd execute 'bp | bd#'
hi Pmenu ctermbg=234 guibg=#1c1c1c ctermfg=lightGrey
hi PmenuSel ctermbg=lightBlue guibg=#008080 ctermfg=black
cabbrev vb vert sb

" Remap 'e' to move to the beginning of the next alphanumeric word
nnoremap e :call SearchNextAlphanumericWord()<CR>

function! SearchNextAlphanumericWord()
    " Move forward one character to ensure movement if already at a word
    normal! l

    " Use regex to search for the start of the next alphanumeric word
    let l:search_pattern = '\v<\w+'
    execute 'normal! ' . search(l:search_pattern, 'W')
endfunction

highlight Terminal guibg=#888888
highlight Terminal guifg=#f0f0f0
:hi terminal ctermbg=16 guibg=#000000

" ----------------------------------------------------- Preferences
let g:gtk_nocache=[0x00000000, 0xfc00ffff, 0xf8000001, 0x78000001]
let g:netrw_winsize = -28
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browse_split = 3

" --------------------------------------------------- TComment
nnoremap <silent> <Leader>cc :TComment<CR>
vnoremap <silent> <Leader>/ :TComment<CR>
nnoremap <silent> <Leader>/ :TComment<CR>

"--------------------------- COC CSS

autocmd FileType scss setl iskeyword+=@-@

" --------------------------------------------------- IndentLine
let g:indentLine_color_term = 239
" let g:indentLine_color_dark = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ----------------------------------------------------FZF
nmap <silent>f :GFiles<CR>
nmap <silent>b :Buffers<CR>
nmap <silent> <leader>f :GFiles<CR>
nmap <silent> <leader>b :Buffers<CR>
vnoremap <leader>s "hy:Rg <C-r>h<CR>
nnoremap <leader>s :Rg <C-r><C-w><CR>

let g:fzf_colors =
		\ { 'fg':      ['fg', 'Normal'],
		\ 'bg':      ['bg', 'Normal'],
		\ 'hl':      ['fg', 'Comment'],
		\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
		\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
		\ 'hl+':     ['fg', 'Statement'],
		\ 'info':    ['fg', 'PreProc'],
		\ 'border':  ['fg', 'Ignore'],
		\ 'prompt':  ['fg', 'Conditional'],
		\ 'pointer': ['fg', 'Exception'],
		\ 'marker':  ['fg', 'Keyword'],
		\ 'spinner': ['fg', 'Label'],
		\ 'header':  ['fg', 'Comment'] }
let g:terminal_ansi_colors = [
		\ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
		\ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
		\ '#626262', '#d75f87', '#87af87', '#ffd787',
		\ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
		\ ]
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'relative': v:false } }

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

function! s:SwitchProject(dir) abort
  if exists(':AutoSession')
    execute 'AutoSession save'
  endif

  %bwipeout!

  execute 'cd' a:dir

  if exists(':AutoSession')
    execute 'AutoSession restore'
	endif
	if exists(':Files')
		execute 'Files'
	endif
endfunction

command! Projects call fzf#run(fzf#wrap({
      \ 'source': 'find ~/Developer -maxdepth 1 -type d',
      \ 'sink':   function('s:SwitchProject')
      \ }))

nnoremap <leader>p :Projects<CR>

" ---------------------------------------------------- Gitgutter
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_preview_win_location = 1
let g:gitgutter_use_location_list = 1
nmap <leader>gk <Plug>(GitGutterNextHunk)
nmap <leader>gj <Plug>(GitGutterPrevHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap <leader>gr <Plug>(GitGutterRevertHunk)
highlight GitGutterAdd    guifg=darkGrey guibg=NONE ctermfg=darkGrey ctermbg=NONE
highlight GitGutterChange guifg=yellow guibg=NONE ctermfg=yellow ctermbg=NONE
highlight GitGutterDelete guifg=red guibg=NONE ctermfg=red ctermbg=NONE

" -------------------------------------------------- Undo tree
nnoremap <silent><leader>uu :UndotreeToggle<CR>
" ------------------------------------------------- NERDTree
let NERDTreeShowHidden=1
let NERDDefaultAlign="left"
let NERDSpaceDelims=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <silent><Leader>ff :NERDTreeToggle<CR>
nnoremap <silent><Leader>nn :NERDTreeFind<CR>

" --------------------------------------------------- vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_solarized_bg='dark'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_theme='raven'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" -------------------------------------------------- go format
autocmd BufWritePre *.go :silent! call CocAction('format')
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" -------------------------------------------------- editorconfig-vim
let g:EditorConfig_core_mode = 'vim_core'
let g:EditorConfig_exec_path = ''

" --- ------------------------------------------------- Deoplete
" let g:deoplete#enable_at_startup = 1

" ---------------------------------------------------- Emmet
" let g:user_emmet_expandabbr_key='<Tab>'
" autocmd FileType html,css EmmetInstall
" autocmd FileType html,css imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

inoremap <silent><expr><ENTER>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<ENTER>" :
\ <DOWN>
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction


inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <leader>l :CocList symbols<CR> 
command! -nargs=? S :CocSearch <args> 
" Search and replace
command! -nargs=? R :vimgrep <args> | :copen
command! -nargs=? RA :cdo s<args> | update
" Use K to show documentation in preview window
nnoremap <leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
else
  call CocActionAsync('doHover')
endif
endfunction

nmap <leader>gn <Plug>(coc-rename)
nmap <leader>n <Plug>(coc-rename)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>q <Plug>(coc-codeaction)
nmap <leader>cl  <Plug>(coc-codelens-action)
" nmap <leader>q <Plug>(coc-fix-current)
" autoclose loclist when close buffer
augroup CloseLoclistWindowGroup

set hidden
set updatetime=300
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
" nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f <Plug>(coc-format-selected)<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <silent> gs :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" coc Cursor configuration
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set cursorline
highlight CursorLineNr term=bold cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=yellow guibg=NONE
highlight CursorLine term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Pmenu guibg=#1c1c1c
highlight PmenuSel guibg=#ff0000 ctermbg=black
highlight CocMenuSel term=bold ctermbg=black ctermfg=black guifg=white guibg=black

"-------------------BufOnly ---

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction


