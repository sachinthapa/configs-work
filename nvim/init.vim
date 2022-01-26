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

let g:python3_host_prog = '/home/sachint/VEnvs/nvim/bin/python'
" Now the actual plugins:

" Vim Color Schemes https://github.com/rafi/awesome-vim-colorschemes
"Plug 'liuchengxu/space-vim-dark'
" Adaptation of one-light and one-dark colorschemes for Vim
"Plug 'rakr/vim-one'
" Light & Dark Vim color schemes inspired by Google's Material Design
"Plug 'NLKNguyen/papercolor-theme'
" Blue-based vim colorscheme
"Plug 'relastle/bluewery.vim'
" Tokyo at night based theme
Plug 'ghifarit53/tokyonight-vim'

" Airline                                                                                        
Plug 'vim-airline/vim-airline'                                                                   
Plug 'vim-airline/vim-airline-themes'                                                            

" Uncompromising Python code formatter
Plug 'psf/black', { 'branch': 'stable' }

" needed so deoplete can auto select the first suggestion
	" set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
	" set completeopt-=preview

" Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}

" neovim nvim-lsp -----------------------------                                                  
Plug 'neovim/nvim-lspconfig'   

" A completion engine plugin for neovim written in Lua. 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For ultisnips users. solution for snippets in Vim
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Scriptable terminal file manager with vim like commands that displays files as you browse      
Plug 'francoiscabrol/ranger.vim'                                                                 

" deleting a buffer in Vim without closing the window
Plug 'rbgrouleff/bclose.vim'                                                                     

" Code commenter                                                                                 
Plug 'scrooloose/nerdcommenter'  

" Completion from other opened files                                                             
Plug 'Shougo/context_filetype.vim'                                                               

" Indent text object                                                                             
Plug 'michaeljsmith/vim-indent-object'                                                           

" Yank history navigation                                                                        
Plug 'vim-scripts/YankRing.vim'

" Linters                                                                                        
Plug 'neomake/neomake'    

" Auto Pairs Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nice icons in the file explorer and file type status line.                                     
Plug 'ryanoasis/vim-devicons'

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
if using_neovim
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

"" Set background transparent
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark

" needed so deoplete can auto select the first suggestion
	" set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
	" set completeopt-=preview


"use 256 colors when possible
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme tokyonight
else
    colorscheme delek
endif

" Airline ------------------------------                                                         
let g:airline_powerline_fonts = 0                                                                
let g:airline_theme = 'deus'                                                                
let g:airline#extensions#whitespace#enabled = 0                                                  
"let g:airline#extensions#hunks#enabled = 1                                                      
let g:airline#extensions#branch#enabled=1                                                        

" Fancy Symbols!!                                                                                
if fancy_symbols_enabled                                                                         
  let g:webdevicons_enable = 1                                                                 
                                                                                               
  """ custom airline symbols                                                                     
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

let g:omni_sql_no_default_maps = 1

lua << EOF

require('nvim_cmp.nvimcmp')

require'lspconfig'.pylsp.setup{}

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

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
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Neomake ------------------------------                                                         
" Run linter on write                                                                            
autocmd! BufWritePost * Neomake                                                                 
autocmd! BufWritePre *.py execute ':Black'

" Check code as python3 by default                                                               
let g:neomake_python_python_maker = neomake#makers#ft#python#python()                           
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()                           
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'                                 
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'                                     

" Disable error messages inside the buffer, next to the problematic line                        
let g:neomake_virtualtext_current_error = 0


"" Set background transparent
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" UltiSnips keybindings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Reload init.vom
nnoremap <leader>sv :source $MYVIMRC<CR>

" Yankring -------------------------------                                                       
if using_neovim                                                                                  
  let g:yankring_history_dir = '~/.config/nvim/'                                               
  " Fix for yankring and neovim problem when system has non-text things                        
  " copied in clipboard                                                                        
  let g:yankring_clipboard_monitor = 0                                                         
else                                                                                             
  let g:yankring_history_dir = '~/.vim/dirs/'                                                  
endif    

:highlight Pmenu guifg=#8D86C2 guibg=#1A1B26
:highlight PmenuSel guifg=#4FEBEB guibg=#364A82
:highlight PmenuBar guifg=#white guibg=#black
:highlight PmenuThumb guifg=#1C1C1C guibg=#FF4F7E

" Custom configurations ----------------

" Just to add the python go-to-definition and similar features, autocompletion                   
" from this plugin is disabled                                                                   
  " Plug 'davidhalter/jedi-vim'                                                                


" Include user's custom nvim configurations
if using_neovim
    let custom_configs_path = "~/.config/nvim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif

if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif






