config := ~/.config/fish
prefix := ~/.local
# SHELL := $(which fish)

.PHONY: clean
clean:
	if test -L $(config); then \
		unlink $(config); \
	fi
	if test -d $(config).orig; then \
		mv $(config).orig $(config); \
	fi

.PHONY: install
install:
	if test -f $(config); then \
		mv $(config) $(config).orig; \
	fi
	ln -s $(CURDIR) $(config)

.PHONY: reinstall
reinstall: clean install ;

.PHONY: uninstall
uninstall: clean ;