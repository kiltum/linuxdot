#!/usr/bin/env bash

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "macos.sh" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "backup.sh" \
		--exclude "pref" \
		--exclude "init" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

doIt;
unset doIt;
