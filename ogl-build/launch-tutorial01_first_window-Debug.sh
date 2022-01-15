#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/ogl/tutorial01_first_window/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/ogl-build/Debug/tutorial01_first_window 
	else
		"/Users/ssk/workspaces/tutorial/ogl-build/Debug/tutorial01_first_window"  
	fi
else
	"/Users/ssk/workspaces/tutorial/ogl-build/Debug/tutorial01_first_window"  
fi
