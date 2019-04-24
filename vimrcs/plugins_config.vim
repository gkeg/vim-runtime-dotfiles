"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Install Plugins 
""""""""""""""""""""""""""""""

set rtp+=~/.fzf
"
"" For Installs 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")

Plug 'lervag/vimtex'
Plug '/usr/local/opt/fzf'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'




call plug#end()
"" JS STUFF """
let g:javascript_plugin_jsdoc = 1
 
""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => Pep8 indent hanging closing
""""""""""""""""""""""""""""""
let g:python_pep8_indent_hang_closing=1
let g:python_pep8_indent_multiline_string=1

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

"" nmap <c-p> <Plug>yankstack_substitute_older_paste
"" nmap <c-n> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"" Opens NERDTree by default if vim is called with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" Automatically close tab if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale for linting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf'],
\   'javascript': ['eslint']
\}

:let b:ale_fixers = {'javascript': ['eslint']}
:let b:ale_linters = {'javascript': ['eslint']}

"let g:ale_fix_on_save = 1
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :Files <cr>
nnoremap <silent> <C-f> :FZF <cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Asyncrun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
let g:javascript_plugin_flow = 1
let g:jsx_est_required = 0

