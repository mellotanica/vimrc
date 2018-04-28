#!/bin/bash

MYDIR="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"

backupAndLink(){
	if test -f "$1"; then
		if test -n "$(diff -q "$1" "$2")"; then
			echo "backing up $1 to $1.orig"
			mv -f "$1" "$1.orig"
		elif test -L "$1"; then
			unlink "$1"
		fi
	fi
	ln -sf "$2" "$1"
}

backupAndLink "$HOME/.vimrc" "$MYDIR/vimrc"
backupAndLink "$HOME/.ctags" "$MYDIR/ctags"

mkdir -p "$HOME/.vim/colors"


ls "$MYDIR/colors" | while read file; do
	backupAndLink "$HOME/.vim/colors/$(basename "$file")" "$MYDIR/colors/$(basename "$file")"
done

if test ! -d "~/.vim/bundle/Vundle.vim/.git"; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

mkdir -p "$HOME/.config/oni"

backupAndLink "$HOME"/.config/oni/config.tsx" "$MYDIR/config.tsx"

vim +PluginInstall +qall
