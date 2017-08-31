#!/bin/bash

MYDIR="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"

backupAndLink(){
	if test -f "$1" -a -n "$(diff -q "$1" "$2")"; then
		echo "backing up $1 to $1.orig"
		mv -f "$1" "$1.orig"
	fi
	ln -s "$2" "$1"
}

backupAndLink "~/.vimrc" "$MYDIR/vimrc"
backupAndLink "~/.ctags" "$MYDIR/ctags"

ls "$MYDIR/colors" | while read file; do
	backupAndLink "~/.vim/colors/$(basename "$file")" "$MYDIR/colors/$(basename "$file")"
done

