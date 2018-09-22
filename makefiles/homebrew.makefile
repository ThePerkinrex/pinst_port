
OS_VERSION :=
COMM := 


ifeq ($(OS),Windows_NT)
	info only for mac
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
	@$(COMM)
    info done