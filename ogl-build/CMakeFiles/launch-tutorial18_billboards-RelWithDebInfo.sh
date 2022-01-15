#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial18_billboards_and_particles/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/ogl-build/RelWithDebInfo/tutorial18_billboards 
	else
		"/Users/ssk/workspaces/tutorial/opengl/ogl-build/RelWithDebInfo/tutorial18_billboards"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/ogl-build/RelWithDebInfo/tutorial18_billboards"  
fi
