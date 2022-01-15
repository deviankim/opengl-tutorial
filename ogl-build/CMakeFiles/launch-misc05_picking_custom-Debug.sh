#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/misc05_picking/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/ogl-build/Debug/misc05_picking_custom 
	else
		"/Users/ssk/workspaces/tutorial/opengl/ogl-build/Debug/misc05_picking_custom"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/ogl-build/Debug/misc05_picking_custom"  
fi
