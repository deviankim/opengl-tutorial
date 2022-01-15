#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/ogl/tutorial13_normal_mapping/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/ogl-build/Release/tutorial13_normal_mapping 
	else
		"/Users/ssk/workspaces/tutorial/ogl-build/Release/tutorial13_normal_mapping"  
	fi
else
	"/Users/ssk/workspaces/tutorial/ogl-build/Release/tutorial13_normal_mapping"  
fi
