INDEX = Packages Packages.gz InRelease
PKG =

all: pkgs $(INDEX)

include packages.mk

Release: Packages apt-release.conf
	apt-ftparchive -c=apt-release.conf release . > $@

Packages: $(PKG) overrides
	dpkg-scanpackages ssbc > $@

%.deb:
	curl -L -f --create-dirs -o $@ https://github.com/$@

%.gz: %
	rm -f $@
	gzip -k $<

In%: %
	rm -f $@
	gpg -a -s --clearsign -o $@ $<

clean:
	@rm -vf $(INDEX)

.PHONY: all pkgs clean
