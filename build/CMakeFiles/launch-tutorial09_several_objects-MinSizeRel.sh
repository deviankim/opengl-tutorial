#!/bin/sh
bindir=$(pwd)
cd /Users/ssk/workspaces/tutorial/opengl/ogl/tutorial09_vbo_indexing/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		GDB_COMMAND-NOTFOUND -batch -command=$bindir/gdbscript  /Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial09_several_objects 
	else
		"/Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial09_several_objects"  
	fi
else
	"/Users/ssk/workspaces/tutorial/opengl/build/MinSizeRel/tutorial09_several_objects"  
fi
