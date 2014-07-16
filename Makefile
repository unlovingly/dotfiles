prefix := ~/.config/fish
# SHELL := $(which fish)

.PHONY: clean
clean:
	if test -L $(prefix); then \
		unlink $(prefix); \
	fi
	if test -d $(prefix).orig; then \
		mv $(prefix).orig $(prefix); \
	fi

.PHONY: install
install:
	if ! test -d ~/.oh-my-fish; then \
		curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish; \
	fi
	if test -f $(prefix); then \
		mv $(prefix) $(prefix).orig; \
	fi
	ln -s $(CURDIR)/fish.d $(prefix)

.PHONY: reinstall
reinstall: clean install ;

.PHONY: uninstall
uninstall: clean ;
