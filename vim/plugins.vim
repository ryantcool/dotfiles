" PLUGINS ---------------------------------------------------------------- {{{
   
" Install vim-plug if not done already                                                                
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubuserconte
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
   
call plug#begin('~/.vim/plugged')
    
    " Visual
    Plug 'itchyny/lightline.vim'  
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'preservim/nerdtree'
    
    " Autocomplete Plug-ins
    Plug 'rust-lang/rust.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()
" }}}
