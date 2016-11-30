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
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " cont;
	if [[ "$cont" =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

cd -
