" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
  if has("cscope")
      set csprg=/usr/bin/cscope
      set csto=0
      set cst
      set csverb
      set cspc=3
      "add any database in current dir
      if filereadable("cscope.out")
          silent cs add cscope.out
      "else search cscope.out elsewhere
      else
         let cscope_file=findfile("cscope.out", ".;")
         let cscope_pre=matchstr(cscope_file, ".*/")
         if !empty(cscope_file) && filereadable(cscope_file)
             silent exe "cs add" cscope_file cscope_pre
         endif
       endif
  endif
  
  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  
 
 " 初始设置为显示行号
  set nu
  " 定义切换显示行号的函数
  function! ToggleLineNumbers()
      if &nu 
          set nonumber
      else
          set nu
      endif
  endfunction
  " 绑定 F3 键到切换函数
  nnoremap <F3> :call ToggleLineNumbers()<CR>


  set ts=4
  set shiftwidth=4
  set softtabstop=4
  set expandtab
  set autoindent 
  inoremap ///   /**/
  
  "防手误
  nnoremap ： :
  cnoremap Q! q!
  command Wq wq
  command Q q
  command WQ wq
  
  
  
  function! EqualSign(char)
    if a:char =~ '=' && getline('.') =~ ".*("
      return a:char
    endif
    
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]
    
    if ex1 =~ '[-=+><>/*]'
      if ex2 !~ '\s'
        return "\<ESC>i".a:char."\<Space>"
      else
        return "\<ESC>xa".a:char."\<Space>"
      endif
    else 
      if ex2 !~ '\s'
        return "\<Space>".a:char."\<Space>\<ESC>a"
      else
        return a:char."\<Space>\<ESC>a"
      endif
    endif
  endfunction
    
  " 自动补全括号
  inoremap ( ()
  inoremap { {}


    "F4进行快速注释块插入
 inoremap <F4> /*****************************************************************************<CR> FunctionName :<CR><BS>  Description : <CR><BS>  Inputi : <CR><BS>  Output : <CR><BS>  Return Value : <CR>*****************************************************************************/
