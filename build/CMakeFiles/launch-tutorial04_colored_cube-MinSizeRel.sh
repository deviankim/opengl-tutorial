#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial04_colored_cube/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial04_colored_cube 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial04_colored_cube"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial04_colored_cube"  
fi
