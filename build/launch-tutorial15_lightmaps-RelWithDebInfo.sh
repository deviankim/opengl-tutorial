#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial15_lightmaps/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/RelWithDebInfo/tutorial15_lightmaps 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/RelWithDebInfo/tutorial15_lightmaps"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/RelWithDebInfo/tutorial15_lightmaps"  
fi
