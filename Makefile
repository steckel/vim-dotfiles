.DEFAULT_GOAL := all
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: modules
modules:
	@echo "IMPLEMENT ME: You'll need to initialize some git submodules"

.PHONY: symlink
symlink:
	@echo "Symlinking configuration files"
	@ln -snf $(ROOT_DIR)/vim $(HOME)/.vim
	@ln -snf $(ROOT_DIR)/vimrc $(HOME)/.vimrc

.PHONY: all
all: modules symlink
