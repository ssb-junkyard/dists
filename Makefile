PKGS = main/binary-amd64/Packages main/binary-amd64/Packages.gz
INDEX = InRelease $(PKGS)
PKG =

all: pkgs $(INDEX)

include packages.mk

Release: $(PKGS) apt-release.conf
	apt-ftparchive -c=apt-release.conf release . > $@

main/binary-amd64/Packages: $(PKG:%=main/binary-amd64/%) Makefile
	(cd main/binary-amd64; dpkg-scanpackages ssbc) | \
		sed '/^Filename/ s/ssbc\///' > $@

%_amd64.deb:
	curl -L -f --create-dirs -o main/binary-amd64/$@ https://github.com/$@

%.gz: %
	rm -f $@
	gzip -k $<

In%: %
	rm -f $@
	gpg -a -s --clearsign -o $@ $<

clean:
	@rm -vf $(INDEX)

.PHONY: all pkgs clean
