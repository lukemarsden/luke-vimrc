#!/bin/sh
# Hack to make colour ls work on Linux, FreeBSD *and* OSX
gnuls --color=auto $@ 2>/dev/null || /bin/ls --color=auto $@ 2>/dev/null || ls $@

