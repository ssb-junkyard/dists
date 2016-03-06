# SSBC APT repository

Repository for packages of SSBC projects for Debian-based operating systems.

## Install

Add the repo to your system:

	sudo sh -c 'echo deb [arch=amd64] https://github.com/ssbc raw/stable main >> /etc/apt/sources.list'

Activate https transport for apt:

	sudo apt-get install apt-transport-https ca-certificates

Add one of our developer's public key to the trusted key list for apt:

	sudo apt-key adv --recv-keys --keyserver pgp.mit.edu B8FF71DA2A375F8F93FCBBDA4D2E80213413F006

Now you can install Patchwork:

	sudo apt-get update && sudo apt-get install ssb-patchwork-electron

## Contributing

1. Publish a `.deb` file in a release of a SSBC project. Or, contribute
  a packaging script so that a SSBC member can build and publish the release.
2. Add the path to the released `.deb` to the `packages.mk` file in this repo.
3. Open a pull-request with the updated `packages.mk` file.
