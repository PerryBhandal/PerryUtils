" Indentation
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set foldmethod=marker
set foldmarker={,}

fu! HELPER_NewlineParens()
	%s/ {\n/\r{\r/g
endfu

fu! HELPER_addCommentBox()
	!boxes -d shell
endfu
