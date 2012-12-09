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
"Gvim��������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

set fenc=utf-8  
set encoding=utf-8      " ����vim�Ĺ�������Ϊutf-8�����Դ�ļ����Ǵ˱��룬vim�����ת������ʾ  
set fileencoding=utf-8      " ��vim�½��ļ��ͱ����ļ�ʹ��utf-8����  
set fileencodings=utf-8,gbk,cp936,chinese,latin-1  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim "���gvim�˵����� 
language messages zh_CN.utf-8   " ���consle�������  

color torte             "��ɫ����
set guioptions-=T       " ���ع�����  
set guifont=Monaco:h10  " ���� && �ֺ�  
set noerrorbells        " �رմ�����ʾ��  
set nobackup            " ��Ҫ�����ļ�  
set linespace=0         " �ַ���������������Ŀ  
set shortmess=atI       " ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ  
set novisualbell        " ��Ҫ��˸   
set scrolloff=3         " ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���  
set mouse=a             " ������buffer���κεط� ->  
set selection=exclusive         " ʹ����꣨����office�� ->  
set selectmode=mouse,key        " �ڹ�����˫����궨λ��  
set cursorline                  " ͻ����ʾ��ǰ��  
set whichwrap+=<,>,h,l        " ����backspace�͹�����Խ�б߽�   
set completeopt=longest,menu    "��Ctrl+N���д��벹ȫ 
set nu                 "��ʾ�к�

"�ÿո��������۵�����
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

"�����۵�
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent! loadview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" �ļ����  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

filetype on                  " ����ļ�����  
filetype indent on               " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ  
filetype plugin on               " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��  
syntax on                    " �﷨����  
filetype plugin indent on    " �����Զ���ȫ  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
" �ı���ʽ���Ű�   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
set list                        " ��ʾTab����->  
set listchars=tab:\|\ ,         " ʹ��һ�������ߴ���  
set tabstop=4           " �Ʊ��Ϊ4  
set autoindent          " �Զ����루�̳�ǰһ�е�������ʽ��  
set smartindent         " �����Զ���������c����ķ�ʽ��  
set softtabstop=4   
set shiftwidth=4        " ����ʱ�м佻��ʹ��4���ո�  
set noexpandtab         " ��Ҫ�ÿո�����Ʊ��  
set cindent         " ʹ��C��ʽ������  
set smarttab            " ���кͶο�ʼ��ʹ���Ʊ��  
set nowrap          " ��Ҫ������ʾһ��   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" ״̬��(������)����ʾ  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set cmdheight=2          " �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2  
set ruler                " ���½���ʾ���λ�õ�״̬��  
set laststatus=2         " ����״̬����Ϣ   
set wildmenu             " ��ǿģʽ�е��������Զ���ɲ���  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"Ctags----"�����к�����ת
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set tags=tags;
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"Taglist----�����б�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"WinManager----�ļ������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
let g:winManagerWindowLayout='FileExplorer|TagList' 
nmap wm :WMToggle<cr>
let g:AutoOpenWinManager = 1 "����vim�Զ���winmanager



