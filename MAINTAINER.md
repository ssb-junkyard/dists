## Updating the repository

After a release is made on one of the projects:

- Update `dists/packages.mk` with the path to the new .deb file on GitHub
  server. The path should begin with `packages/` and follow with the part of
  the URL following `https://github.com/ssbc/`.

- Copy or link the .deb file that you locally have to the path under the local
  directory `packages/`. This file must be the same file as is in the GitHub
  release.

- Run `make`. Authenticate with GPG to sign the release as needed.

- Commit and push. Note that if you add or commit with `--patch`, git will
  not prompt you to add the modified binary Packages.gz file(s), so you have
  to add them explicitly or use `git commit --all`.
