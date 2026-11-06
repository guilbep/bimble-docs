# bimble-docs

The user manual of [Bimble](https://github.com/guilbep/bimble), open-source structural BIM:
**https://guilbep.github.io/bimble-docs/**

Built with [Zensical](https://zensical.org):

```sh
make docs-serve   # preview on localhost, rebuilt on save
make docs         # build into site/ (strict: a broken link fails)
```

Every push to `main` publishes the site to GitHub Pages (`.github/workflows/docs.yml`).

Pages describe what the released program does: check commands and keys against `bimble --help`
and the source before writing them. Images are made from the demo model (`bimble demo`), never
from client files.
