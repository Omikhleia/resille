# Build and release notes

Reminders on how the image is built and published.

## Local builds

See the [README](README.md#building-the-images). Local builds are never published.

## Publishing a release

The workflow [`.github/workflows/docker-tag-publish.yml`](.github/workflows/docker-tag-publish.yml) builds the image and pushes it to `ghcr.io/omikhleia/resille`.

It pushes **only when a tag starting with `v` is pushed**:

```sh
git tag v1.2.3
git push origin v1.2.3
```

Tag format: `vMAJOR.MINOR.PATCH`, for example `v1.2.3`.

| Pushed tag | Image tags published |
|---|---|
| `v1.2.3` | `1.2.3`, `1.2`, `latest` |

Tags that do not start with `v` (for example `1.2.3`) do not trigger the workflow.

## What the CI does and does not do

- It always builds **without** the non-redistributable fonts (`NONFREE_FONTS=false` is passed explicitly). Never publish an image built with `NONFREE_FONTS=true`.
- It builds **without cache**, so each release refetches the fonts and the latest Lua rocks (including `resilient.sile`). This is slower but avoids shipping stale layers.
- It builds `linux/amd64` only, because the pinned Graphviz packages are amd64.
- Running it manually from the Actions tab (`workflow_dispatch`) builds the image but **pushes nothing**. It is only a build check.
- Pushes to branches do not trigger it.

## Things to remember

- Releases are not reproducible by design: the build picks up the current versions of unpinned fonts and rocks. Pinned: SILE, Graphviz and most font archives.
- The license inventory for the image is in [build/THIRD-PARTY.md](build/THIRD-PARTY.md). Update it when components change.
