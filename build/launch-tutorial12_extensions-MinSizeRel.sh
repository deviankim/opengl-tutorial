#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial12_extensions/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial12_extensions 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial12_extensions"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial12_extensions"  
fi
