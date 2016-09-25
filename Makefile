prefix?=/usr/local
BINDIR=$(DESTDIR)$(prefix)/bin
DATADIR=$(DESTDIR)$(prefix)/share/yle-dl

all:

install:
	-mkdir -p $(BINDIR)
	cp yle-dl $(BINDIR)
	-mkdir -p $(DATADIR)
	cp AdobeHDS.php $(DATADIR)

install-adobehds:
	@echo "make install-adobehds is no longer needed"

uninstall:
	rm -f $(BINDIR)/yle-dl
	rm -f $(DATADIR)/AdobeHDS.php
	-rmdir $(DATADIR)

# Uninstall librtmp and plugin installed by pre-2.0 versions
plugindir=$(prefix)/lib/librtmp/plugins
mandir=$(prefix)/man
libdir=$(prefix)/lib
PLUGINDIR=$(DESTDIR)$(plugindir)
MANDIR=$(DESTDIR)$(mandir)
LIBDIR=$(DESTDIR)$(libdir)
uninstall-old-rtmpdump:
	rm -f $(BINDIR)/rtmpdump
	rm -f $(BINDIR)/rtmpdump-yle
	rm -f $(PLUGINDIR)/yle.*
	rm -f $(LIBDIR)/librtmp.*
	rm -f $(LIBDIR)/pkgconfig/librtmp.pc
	rm -f $(MANDIR)/man1/rtmpdump.1
	rm -f $(MANDIR)/man3/librtmp.3
	rm -f $(MANDIR)/man8/rtmpgw.8