#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/ogl/tutorial16_shadowmaps/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/ogl-build/MinSizeRel/tutorial16_shadowmaps 
	else
		"/Users/ssk/workspaces/tutorial/ogl-build/MinSizeRel/tutorial16_shadowmaps"  
	fi
else
	"/Users/ssk/workspaces/tutorial/ogl-build/MinSizeRel/tutorial16_shadowmaps"  
fi
