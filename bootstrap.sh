#!/usr/bin/env bash

cd ~/dotfiles

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read "continue?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	if [[ "$continue" =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

cd -
