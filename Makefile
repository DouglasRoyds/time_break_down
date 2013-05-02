#!/usr/bin/make
# A

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
DESTDIR = /

scriptfiles = $(wildcard add_* analyse_* edit_* print_* time_break_down_*)
$(info scriptfiles = $(scriptfiles))

all:
	@echo "Nothing to do"
	@echo "You probably meant to type"
	@echo "   $$ sudo make checkinstall"

install:
	@install -d $(DESTDIR)$(bindir)
	@install -v -m775 $(scriptfiles) $(DESTDIR)$(bindir)

uninstall:
	for file in $(scriptfiles); do \
	   echo $(DESTDIR)$(bindir)$$file; \
	   rm -vf $(DESTDIR)$(bindir)$$file; \
	done
	rmdir -v $(DESTDIR)$(bindir) || true

checkinstall:
	sudo checkinstall --pkgname=time-break-down

