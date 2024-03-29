" Fisa-vim-config, a config for both Vim and NeoVim
" http://vim.fisadev.com
" version: 12.0.1

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal 
" (if you aren't using one of those fonts, you will see funny characters here. 
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 1


set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the config down below 
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy 
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

" Now the actual plugins:

" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Scriptable terminal file manager with vim like commands that displays files as you browse 
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'


" Better file browser
"Plug 'scrooloose/nerdtree'

" Class/module browser
Plug 'majutsushi/tagbar'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Vim Color Schemes https://github.com/rafi/awesome-vim-colorschemes
"Plug 'liuchengxu/space-vim-dark'
" Adaptation of one-light and one-dark colorschemes for Vim
"Plug 'rakr/vim-one'
" Light & Dark Vim color schemes inspired by Google's Material Design
Plug 'NLKNguyen/papercolor-theme'
" Blue-based vim colorscheme
"Plug 'relastle/bluewery.vim'
" Tokyo at night based theme
Plug 'ghifarit53/tokyonight-vim'


" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Async autocompletion
	" if using_neovim && vim_plug_just_installed
	    " Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
	" else
	    " Plug 'Shougo/deoplete.nvim'
	" endif
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'


" neovim nvim-lsp -----------------------------
Plug 'neovim/nvim-lspconfig'


" prabirshrestha vim-lsp -----------------------------
" Async Language Server Protocol plugin for vim8 and neovim
	" Plug 'prabirshrestha/vim-lsp'
	" Plug 'mattn/vim-lsp-settings'


" Python autocompletion
	" Plug 'deoplete-plugins/deoplete-jedi'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
	" Plug 'davidhalter/jedi-vim'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Surround
Plug 'tpope/vim-surround'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
    "Plug 'sheerun/vim-polyglot'

" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'

" Paint css colors with the real color
"Plug 'lilydjwg/colorizer'

" Window chooser
Plug 't9md/vim-choosewin'

" Automatically sort python imports
"Plug 'fisadev/vim-isort'

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

"   html in a simple way
	"Plug 'mattn/emmet-vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
"Plug 'mhinz/vim-signify'

" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" Linters
Plug 'neomake/neomake'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
"Plug 'myusuf3/numbers.vim'

" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'

if using_vim
    " Consoles as buffers (neovim has its own consoles as buffers)
    Plug 'rosenfeld/conque-term'
    " XML/HTML tags navigation (neovim has its own)
    Plug 'vim-scripts/matchit.zip'
endif

" Code searcher. If you enable it, you should also configure g:hound_base_url 
" and g:hound_port, pointing to your hound instance
" Plug 'mattn/webapi-vim'
" Plug 'jfo/hound.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
 
lua << EOF
 require'lspconfig'.pylsp.setup{}
EOF

lua << EOF
 local nvim_lsp = require('lspconfig')
 
 -- Use an on_attach function to only map the following keys
 -- after the language server attaches to the current buffer
 local on_attach = function(client, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
 
   --Enable completion triggered by <c-x><c-o>
   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
 
   -- Mappings.
   local opts = { noremap=true, silent=true }
 
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
 
 end
 
 -- Use a loop to conveniently call 'setup' on multiple servers and
 -- map buffer local keybindings when the language server attaches
 local servers = { 'pylsp' }
 for _, lsp in ipairs(servers) do
   nvim_lsp[lsp].setup {
     on_attach = on_attach,
     flags = {
       debounce_text_changes = 150,
     }
   }
 end
EOF

set completeopt-=preview

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

if using_vim
    " A bunch of things that are set by default in neovim, but not in vim

    " no vi-compatible
    set nocompatible

    " allow plugins by file type (required for plugins!)
    filetype plugin on
    filetype indent on

    " always show status bar
    set ls=2

    " incremental search
    set incsearch
    " highlighted search results
    set hlsearch

    " syntax highlight on
    syntax on

    " better backup, swap and undos storage for vim (nvim has nice ones by
    " default)
    set directory=~/.vim/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/.vim/dirs/backups " where to put backup files
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/.vim/dirs/undos
    set viminfo+=n~/.vim/dirs/viminfo
    " create needed directories if they don't exist
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif
end

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab


" show/hide realtive line numbers 
"set nu rnu
set nonumber

" Set signcolumn always
set signcolumn=yes

" Set margin without the numbers
set foldcolumn=0


" Enable Line cursor
"color desert
set cursorline
" set the prefered colours, pick one line here only.
" dark grey, better you can get if you don't support 256 colours
"hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE
" light grey, no 256 colors
"hi CursorLine   cterm=NONE ctermbg=7 ctermfg=NONE
" dark redish
"hi CursorLine   cterm=NONE ctermbg=52 ctermfg=NONE
" dark bluish
highlight CursorLine   cterm=NONE ctermbg=17 ctermfg=NONE
"hi CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" very light grey
"hi CursorLine   cterm=NONE ctermbg=254 ctermfg=NONE
" yelowish
"hi CursorLine   cterm=NONE ctermbg=229 ctermfg=NONE
" almost black
"hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
"hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

let g:tokyonight_style = 'storm' " available: night, storm


"use 256 colors when possible
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme tokyonight
else
    colorscheme delek
endif

"" Set background transparent
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark

" needed so deoplete can auto select the first suggestion
	" set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
	" set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
" Opening ranger instead of netrw when you open a directory
"let g:NERDTreeHijackNetrw = 0 

"map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
"nmap ,t :NERDTreeFind<CR>
" don;t show these file types
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
"highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrow
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
"let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
"let NERDTreeDirArrowExpandable = \"\u00a0"
"let NERDTreeDirArrowCollapsible = \"\u00a0"
"let NERDTreeNodeDelimiter = \"\x07"

" Autorefresh on tree focus
"function! NERDTreeRefresh()
"    if &filetype == \"nerdtree\"
"        silent exe substitute(mapcheck("R"), \"<CR>", \"", \"")
"    endif
"endfunction

"autocmd BufEnter * call NERDTreeRefresh()

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write
 autocmd! BufWritePost * Neomake

" Check code as python3 by default
 let g:neomake_python_python_maker = neomake#makers#ft#python#python()
 let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
 let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
 let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'
 
 " Disable error messages inside the buffer, next to the problematic line
 let g:neomake_virtualtext_current_error = 0

 " Fzf ------------------------------


" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>


" Deoplete -----------------------------

" Use deoplete.
	" let g:deoplete#enable_at_startup = 1
	" call deoplete#custom#option({
	" \   'ignore_case': v:true,
	" \   'smart_case': v:true,
	" \})
" complete with words from any opened file
	" let g:context_filetype#same_filetypes = {}
	" let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
	" let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
"let g:jedi#goto_command = ',d'
" Find ocurrences
"let g:jedi#usages_command = ',o'
" Find assignments
"let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
"nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
nmap ,r :Ack 
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
"let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
"nmap <leader>sn <plug>(signify-next-hunk)
"nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
"highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
"highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
"highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
"highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
"highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
"highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

if using_neovim
    let g:yankring_history_dir = '~/.config/nvim/'
    " Fix for yankring and neovim problem when system has non-text things
    " copied in clipboard
    let g:yankring_clipboard_monitor = 0
else
    let g:yankring_history_dir = '~/.vim/dirs/'
endif

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled=1

" Fancy Symbols!!

if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else
    let g:webdevicons_enable = 0
endif

" Custom configurations ----------------

" Include user's custom nvim configurations
if using_neovim
    let custom_configs_path = "~/.config/nvim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif

if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif





