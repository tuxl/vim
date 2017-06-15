"vundle配置
"支持在vim启动时自动执行当前工作目录的.vimrc文件 可以实现不同项目使用不同vim配置的目的
set exrc
"关闭vim的兼容模式
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"在begin 和 end之间添加想要的插件git地址

Plugin 'VundleVim/Vundle.vim'

"nerdtree
Plugin 'scrooloose/nerdtree'

"cppvim
Plugin 'vim-scripts/cpp.vim--Skvirsky.git'

"缩进插件
Plugin 'vim-scripts/Indent-Guides.git'

"状态栏改进
Plugin 'Lokaltog/vim-powerline'

"缓冲区插件
Plugin 'jlanzarotta/bufexplorer'

"youcompleteme插件
Plugin 'Valloric/YouCompleteMe'

"智能注释插件
Plugin 'scrooloose/nerdcommenter'

"自动配对插件
Plugin 'jiangmiao/auto-pairs'

"python pep8插件
Plugin 'tell-k/vim-autopep8'

"括号添加颜色"
Plugin 'kien/rainbow_parentheses.vim'

"文件查找"
Plugin 'kien/ctrlp.vim'

"xml编辑插件
Plugin 'sukima/xmledit.git' 

"语法检查插件
Plugin 'vim-syntastic/syntastic'


"配合syntastic 的 python语法检查插件
Plugin 'https://gitlab.com/pycqa/flake8'

call vundle#end()

filetype plugin indent on

"高亮当前列
set cursorcolumn

"设置将tab建字第转换成空格
set expandtab

"显示行号
set nu

"设置编码识别
set fileencodings=ucs-bom,utf-8,cp936

"设置文件夹编码
set fileencoding=utf-8

set termencoding=utf-8

set nowrap

set shiftwidth=4

"设置tab键的缩进
set tabstop=4 

"设置自动缩进
set cindent

"去掉备份文件
set nobackup

"总是显示状态行
set laststatus=2

"检索时忽略大小写
set ignorecase

"启用鼠标
set mouse=a

"高亮搜索结果
set hlsearch

"设置配色
colorscheme desert

" 启动时关闭折叠功能
set nofoldenable

set t_Co=256

"高亮当前行
set cursorline

"f2启动粘贴模式 防止粘贴乱码"
set pastetoggle=<F2>

"光标所在行的高亮样式
hi CursorLine ctermfg=NONE ctermbg=0 cterm=NONE
"光标所在列的高亮样式
hi cursorcolumn ctermfg=NONE ctermbg=0 cterm=NONE

"设置NerdTree 映射到f3键
map <F3> :NERDTreeToggle<CR>
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.obj$', '\.o$']
"显示书签"
let NERDTreeShowBookmarks=1

"*******设置Indent-Guides******
"设置自动启动缩进线
let g:indent_guides_enable_on_vim_startup = 1

"设置对齐线宽度为一
let g:indent_guides_guide_size=1

"******* END ******

"************youcompleteme配置***********
"前导符改成了,号
let mapleader = "," 
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"设置python路径 此处设置为python3
let g:ycm_python_binary_path = '/usr/bin/python3'

"是否在注释中也开启补全
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"字符串中也开启补全
let g:ycm_complete_in_strings = 1

"开启语意补全"
let g:ycm_seed_identifiers_with_syntax = 1

"*************youcompleteme配置 END **********


"***********nerdcommenter配置项***********************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"***********END**********************

"autopep8设置 该插件依赖pip包autopep8 所以要先pip安装autopep8
let g:autopep8_disable_show_diff=1
"F4映射为自动格式化代码"
autocmd FileType python map <buffer> <F4> :call Autopep8()<CR>

"rainbow_parentheses.vim插件"
let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3']]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"ctrlp配置"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }