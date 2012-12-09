set nocompatible
source $VIMRUNTIME/vimrc_example.vim
if has('win32')
source $VIMRUNTIME/mswin.vim
behave mswin
endif
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"Gvim自身设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

set fenc=utf-8  
set encoding=utf-8      " 设置vim的工作编码为utf-8，如果源文件不是此编码，vim会进行转换后显示  
set fileencoding=utf-8      " 让vim新建文件和保存文件使用utf-8编码  
set fileencodings=utf-8,gbk,cp936,chinese,latin-1  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim "解决gvim菜单乱码 
language messages zh_CN.utf-8   " 解决consle输出乱码  

color torte             "配色方案
set guioptions-=T       " 隐藏工具栏  
set guifont=Monaco:h10  " 字体 && 字号  
set noerrorbells        " 关闭错误提示音  
set nobackup            " 不要备份文件  
set linespace=0         " 字符间插入的像素行数目  
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示  
set novisualbell        " 不要闪烁   
set scrolloff=3         " 光标移动到buffer的顶部和底部时保持3行距离  
set mouse=a             " 可以在buffer的任何地方 ->  
set selection=exclusive         " 使用鼠标（类似office中 ->  
set selectmode=mouse,key        " 在工作区双击鼠标定位）  
set cursorline                  " 突出显示当前行  
set whichwrap+=<,>,h,l        " 允许backspace和光标键跨越行边界   
set completeopt=longest,menu    "按Ctrl+N进行代码补全 
set nu                 "显示行号

"用空格来开关折叠代码
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

"保存折叠
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent! loadview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" 文件相关  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

filetype on                  " 侦测文件类型  
filetype indent on               " 针对不同的文件类型采用不同的缩进格式  
filetype plugin on               " 针对不同的文件类型加载对应的插件  
syntax on                    " 语法高亮  
filetype plugin indent on    " 启用自动补全  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
" 文本格式和排版   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
set list                        " 显示Tab符，->  
set listchars=tab:\|\ ,         " 使用一高亮竖线代替  
set tabstop=4           " 制表符为4  
set autoindent          " 自动对齐（继承前一行的缩进方式）  
set smartindent         " 智能自动缩进（以c程序的方式）  
set softtabstop=4   
set shiftwidth=4        " 换行时行间交错使用4个空格  
set noexpandtab         " 不要用空格代替制表符  
set cindent         " 使用C样式的缩进  
set smarttab            " 在行和段开始处使用制表符  
set nowrap          " 不要换行显示一行   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" 状态行(命令行)的显示  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set cmdheight=2          " 命令行（在状态行下）的高度，默认为1，这里是2  
set ruler                " 右下角显示光标位置的状态行  
set laststatus=2         " 开启状态栏信息   
set wildmenu             " 增强模式中的命令行自动完成操作  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"Ctags----"程序中函数跳转
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set tags=tags;
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"Taglist----函数列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"WinManager----文件浏览器
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
let g:winManagerWindowLayout='FileExplorer|TagList' 
nmap wm :WMToggle<cr>
let g:AutoOpenWinManager = 1 "进入vim自动打开winmanager



