#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial02_red_triangle/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/ogl-build/Debug/tutorial02_red_triangle 
	else
		"/Users/ssk/workspaces/tutorial/opengl/ogl-build/Debug/tutorial02_red_triangle"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/ogl-build/Debug/tutorial02_red_triangle"  
fi
