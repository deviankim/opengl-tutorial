#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial10_transparency/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/Debug/tutorial10_transparency 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/Debug/tutorial10_transparency"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/Debug/tutorial10_transparency"  
fi
