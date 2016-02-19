## Updating the repository

After a release is made of one of the projects:

- Update `dists/packages.mk` with the path to the new .deb file on the
  server.
- Run `make -C dists`. Authenticate to sign the release as needed.
- Commit and push.
