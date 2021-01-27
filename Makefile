.DEFAULT_GOAL := install
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: git-submodules
git-submodules:
	@echo "initializing and updating git submodules..."
	@git submodule update --init --recursive

.PHONY: solarized
solarized: git-submodules
	@echo "installing solarized files...."
	@ln -snf $(ROOT_DIR)/vim/pack/plugins/start/vim-colors-solarized/colors $(HOME)/.vim/

.PHONY: install
install: git-submodules solarized
	@echo "symlinking configuration files...."
	@ln -snf $(ROOT_DIR)/vim $(HOME)/.vim
	@ln -snf $(ROOT_DIR)/vimrc $(HOME)/.vimrc
