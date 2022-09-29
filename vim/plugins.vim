" PLUGINS ---------------------------------------------------------------- {{{
   
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif                                                                

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
