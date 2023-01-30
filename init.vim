"///-----------------------------------
" init.vim
"   place in ~/.config/nvim
"   start nvim
"   execute command :PlugInstall
"-------------------------------------///
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
" Aesthetics
  Plug 'mhinz/vim-startify'                 "startup screen
  Plug 'Yggdroot/indentLine'                "display thin vertical lines at each indentation level for code indented with spaces
  Plug 'ryanoasis/vim-devicons'             "file type icons for plugins
  Plug 'myusuf3/numbers.vim'                "better line numbers
  Plug 'vim-airline/vim-airline'            "lean & mean status/tabline for vim that's light as air 
  Plug 'vim-airline/vim-airline-themes'     "themes for vim-airline
  Plug 'ianks/gruvbox'                      "gruvbox theme
  Plug 'airblade/vim-gitgutter'             "shows a git diff in the sign column 
  Plug 'altercation/vim-colors-solarized'   "solarized color scheme
" Completion/templating
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } 
                                            "dark powered asynchronous completion framework for neovim/Vim8
  Plug 'jiangmiao/auto-pairs'               "insert or delete brackets, parens, quotes in pair.
  Plug 'ervandew/supertab'                  "allows you to use <Tab> for all your insert completion needs (:help ins-completion)
  Plug 'tpope/vim-endwise'                  "helps to end certain structures automatically                 
  Plug 'preservim/nerdcommenter'            "comment functions so powerful—no comment necessary
  Plug 'SirVer/ultisnips'                   "the ultimate solution for snippets in Vim. It has many features, speed being one of them.
  Plug 'honza/vim-snippets'                 "snipMate & UltiSnip Snippets
  Plug 'vim-autoformat/vim-autoformat'      "format code with one button press (or automatically on save)
  Plug 'deoplete-plugins/deoplete-jedi'     "python code completion
" Command extention
  Plug 'easymotion/vim-easymotion'          "provides a much simpler way to use some motions in vim
  Plug 'wellle/targets.vim'                 "adds various text objects to give you more targets to operate on
  Plug 'tpope/vim-surround'                 "provides mappings to easily delete, change and add such surroundings in pairs
  Plug 'junegunn/vim-easy-align'            "a simple, easy-to-use Vim alignment plugin
  Plug 'mg979/vim-visual-multi'             "multiple selection
" Utils
  Plug 'neomake/neomake'                    "Asynchronous linting and make framework for Neovim/Vim
  Plug 'kassio/neoterm'                     "wrapper of some vim/neovim's :terminal functions.
  Plug 'sjl/gundo.vim'                      "visualize undo
  Plug 'chrisbra/NrrwRgn'                   "a Narrow Region Plugin for vim (like Emacs Narrow Region)
  Plug 'maxbrunsfeld/vim-yankstack'         "lightweight implementation of the Emacs 'kill ring' for Vim
  Plug 'itchyny/calendar.vim'               "calendar application for vim
" Navigation
  Plug 'preservim/nerdtree'                 "The NERDTree is a file system explorer for the Vim editor
  Plug 'scrooloose/nerdtree-project-plugin' "saves the state of the NERDTree between sessions
  Plug 'ctrlpvim/ctrlp.vim'                 "full path fuzzy file, buffer, mru, tag, ... finder for Vim.
  Plug 'wenlongche/SrcExpl'                 "source code explorer that provides context for the currently selected keyword
  Plug 'preservim/tagbar'                   "a class outline viewer for Vim
  Plug 'rizzatti/dash.vim'                  "search Dash.app from Vim
  Plug 'eugen0329/vim-esearch'              "easy async search and replace across multiple files.
  Plug 'farmergreg/vim-lastplace'           "reopen files at your last edit position
  Plug 'lstwn/broot.vim'                    "broot integration
" Java
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp' 
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'puremourning/vimspector'
  Plug 'mfussenegger/nvim-jdtls'
  Plug 'artur-shaik/jc.nvim'                
" HTML/CSS/JavaScript
  Plug 'mattn/emmet-vim'                    "emmet.io for vim
call plug#end()
" }}}
"
" BASIC SETTINGS ------------------------------------------------------------- {{{
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
  set fileformat=unix
  set fileformats=unix,dos,mac
  set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
  set incsearch ignorecase smartcase hlsearch
  set wildmode=longest,list,full wildmenu
  set ruler laststatus=2 showcmd showmode
  set list listchars=trail:»,tab:»-
  set fillchars+=vert:\ 
  set wrap breakindent
  set textwidth=0
  set hidden
  set number
  set title
  filetype on
  filetype plugin on
  filetype plugin indent on
  syntax on
  set smartindent
  set expandtab         "tab to spaces
  set shiftwidth=2      "the width for indent
  set foldenable
  set foldmethod=indent "folding by indent
  set foldlevel=99
  set ignorecase       "ignore the case when search texts
  set smartcase        "if search text contains uppercase case will not be ignored
  set cursorline       "hilight the line of the cursor
  set cursorcolumn     "hilight the column of the cursor
  set nowrap           "no line wrapping
  colorscheme gruvbox  "use the theme gruvbox
  set background=dark  "use the light version of gruvbox
  " change the color of chars over the width of 80 into blue
  " (uncomment to enable it)
  "au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" }}}  
"
" MAPPINGS --------------------------------------------------------------- {{{
  " \\ => go to command mode
    imap <leader><leader> <esc>:
  " go => go to anywhere
    nmap go <Plug>(easymotion-jumptoanywhere)
  " <c-v> => for pasting
    imap <c-v> <esc>"+pa
  " <F5> for gundo
    nnoremap <F5> GundoToggle<CR>
  " broot
    nnoremap <silent> <leader>e :BrootWorkingDir<CR>
    nnoremap <silent> - :BrootCurrentDir<CR>
" }}}

" PLUGIN CONFIGURATION --------------------------------------------------- {{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1