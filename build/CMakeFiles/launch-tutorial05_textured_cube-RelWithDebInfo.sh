#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial05_textured_cube/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/RelWithDebInfo/tutorial05_textured_cube 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/RelWithDebInfo/tutorial05_textured_cube"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/RelWithDebInfo/tutorial05_textured_cube"  
fi
