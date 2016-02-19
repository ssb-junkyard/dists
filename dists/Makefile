INDEX = Packages Packages.gz Release Release.gpg
PKG =

all: pkgs $(INDEX)

include packages.mk

Release: Packages apt-release.conf
	apt-ftparchive -c=apt-release.conf release . > $@

Packages: $(PKG) overrides
	dpkg-scanpackages ssbc > $@

%.deb:
	curl -f --create-dirs -o $@ https://github.com/$@

%.gz: %
	rm -f $@
	gzip -k $<

%.gpg: %
	rm -f $@
	gpg -ab -o $@ $<

clean:
	@rm -vf $(INDEX)

.PHONY: all pkgs clean
