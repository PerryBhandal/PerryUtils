if !has('python')
	finish
endif

function! DebugCommanderStart()
	pyfile /home/perry/.vim/plugin/debug_commander_start.py
endfunc

