#!/usr/bin/make
# An install-only makefile to allow easy running of checkinstall.

PACKAGE = time-break-down
prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
datarootdir = $(prefix)/share
docdir = $(datarootdir)/doc/$(PACKAGE)
DESTDIR = /

scriptfiles = $(wildcard add_* analyse_* edit_* print_* time_break_down_*)
docfiles = $(wildcard *.md)

help:
	@echo "An install-only makefile to allow easy running of checkinstall:"
	@echo "   $$ sudo make checkinstall"
	@echo "Installs the following scripts:"
	@echo -n "   "; echo $(scriptfiles) | sed 's# \+#\n   #g'

install:
	@install -d $(DESTDIR)$(bindir)
	@install -d $(DESTDIR)$(docdir)
	@install -v -m775 $(scriptfiles) $(DESTDIR)$(bindir)
	@install -v -m664 $(docfiles) $(DESTDIR)$(docdir)

checkinstall:
	sudo checkinstall --pkgname=$(PACKAGE) --nodoc

