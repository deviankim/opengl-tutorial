#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial06_keyboard_and_mouse/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/Debug/tutorial06_keyboard_and_mouse 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/Debug/tutorial06_keyboard_and_mouse"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/Debug/tutorial06_keyboard_and_mouse"  
fi
