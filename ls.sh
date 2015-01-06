#!/bin/sh
# Hack to make colour ls work on Linux *and* OSX
/bin/ls --color=auto $* 2>/dev/null || ls $*

