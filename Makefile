.PHONY: gitconfig-include-local
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
SHELL := /bin/bash
DIR := ${CURDIR}
nvim := nvim-from-system
vscodePhpDebugVersion := '1.24.3'

gitconfig-include-local:
	git config --local include.path "$$(git rev-parse --show-toplevel)/.gitconfig"
	
submodule-update:
	git su

start: gitconfig-include-local submodule-update install-vscode-php-debug

test-visual-evaluation:
	$(DIR)/bin/$(nvim) -S ./test/01-float-hover-clean/run.vim test/fixture/foo.php

check-requirements:
	$(DIR)/.config/bin/check-requirements
