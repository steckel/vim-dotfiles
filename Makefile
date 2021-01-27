.DEFAULT_GOAL := install
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
VIM_DIR := $(HOME)/.vim
VIM_PACKAGE_DIR := $(VIM_DIR)/pack

.PHONY: directories
directories:
	@mkdir -p $(VIM_DIR)
	@mkdir -p $(VIM_PACKAGE_DIR)

.PHONY: git-submodules
git-submodules:
	@echo "initializing and updating git submodules..."
	@git submodule update --init --recursive

.PHONY: solarized
solarized: directories git-submodules
	@echo "installing solarized files...."
	@ln -snf $(ROOT_DIR)/vim/pack/plugins/start/vim-colors-solarized/colors $(VIM_DIR)

.PHONY: install
install: git-submodules directories solarized
	@echo "symlinking configuration files...."
	@ln -snf $(ROOT_DIR)/plugins $(VIM_PACKAGE_DIR)
	@ln -snf $(ROOT_DIR)/vimrc $(HOME)/.vimrc
