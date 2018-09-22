OS_VERSION :=
COMM := 
BAT_VERSION := 0.7.0

ifeq ($(OS),Windows_NT)
	info only for unix
else
		UNAME_S := $(shell uname -s)
		ifeq ($(UNAME_S),Linux)
				info only for mac
		endif
		ifeq ($(UNAME_S),Darwin)
				COMM := /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		endif
endif

install:
    @tar -xzf v$BAT_VERSION.tar.gz
	@$(COMM)
    @rm v$BAT_VERSION.tar.gz
    info done