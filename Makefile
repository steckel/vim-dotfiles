.DEFAULT_GOAL := all
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: git-submodules
git-submodules:
	@echo "initializing and updating git submodules..."
	@git submodule update --init --recursive

.PHONY: install
install:
	@echo "symlinking configuration files...."
	@ln -snf $(ROOT_DIR)/vim $(HOME)/.vim
	@ln -snf $(ROOT_DIR)/vimrc $(HOME)/.vimrc

.PHONY: all
all: git-submodules install
