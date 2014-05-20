syntax on
"设置（软）制表符宽度为4：
set tabstop=4
set softtabstop=4
"设置缩进的空格数为4
set shiftwidth=4
"设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent
"设置 使用 C 语言的自动缩进方式：
set cindent
"设置C 语言的具体缩进方式（以我的windows风格为例）：
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"如果想在左侧显示文本的行号，可以用以下语句：
set nu
"set roler "设置光标显示
"最后，如果没有下列语句，就加上吧：
if &term=="xterm"
	set t_Co=8
        set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif
