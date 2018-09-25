ARDUINO_VERSION = 0.2.2-alpha.preview
OS_VERSION :=
UNPACK_COMM := tar xvjf
PACK := .tar.bz2
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
ifeq ($(OS),Windows_NT)
	err not for windows
else
		UNAME_S := $(shell uname -s)
		ifeq ($(UNAME_S),Linux)
				UNAME_P := $(shell uname -p)
				ifeq ($(UNAME_P),x86_64)
						OS_VERSION := linux64
				endif
				ifneq ($(filter %86,$(UNAME_P)),)
						OS_VERSION := linux32
				endif
				ifneq ($(filter arm%,$(UNAME_P)),)
						OS_VERSION := linuxarm
				endif
		endif
		ifeq ($(UNAME_S),Darwin)
				OS_VERSION := osx
				UNPACK_COMM := unzip
				PACK := .zip
		endif
endif

install:
	@echo $(current_dir)
	@$(UNPACK_COMM) "$(HOME)/.pinst/arduino-cli-$(ARDUINO_VERSION)-$(OS_VERSION)$(PACK)"
	@mv "arduino-cli-$(ARDUINO_VERSION)-$(OS_VERSION)" "$(HOME)/.pinst/arduino-cli"
	@rm "$(HOME)/.pinst/arduino-cli-$(ARDUINO_VERSION)-osx.zip"
	@rm "$(HOME)/.pinst/arduino-cli-$(ARDUINO_VERSION)-linux64.tar.bz2"
	@rm "$(HOME)/.pinst/arduino-cli-$(ARDUINO_VERSION)-linux32.tar.bz2"
	@rm "$(HOME)/.pinst/arduino-cli-$(ARDUINO_VERSION)-linuxarm.tar.bz2"
	@rm "$(HOME)/.pinst/arduino-cli-$(ARDUINO_VERSION)-windows.zip"
	

