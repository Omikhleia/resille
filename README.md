# resille

[![Version](https://img.shields.io/github/v/tag/Omikhleia/resille?label=ghcr&logo=docker)](https://github.com/Omikhleia/resille/pkgs/container/resille)
[![Build](https://github.com/Omikhleia/resille/actions/workflows/docker-tag-publish.yml/badge.svg)](https://github.com/Omikhleia/resille/actions/workflows/docker-tag-publish.yml)
[![License](https://img.shields.io/github/license/Omikhleia/resille)](LICENSE)

The _résille_ project is a docker-based digital typesetting system.

It is based on the [SILE typesetting system](https://sile-typesetter.org/) and extends it with additional modules and tools for professional book production.

It notably integrates the [resilient.sile](https://github.com/Omikhleia/resilient.sile) collection of modules and tools for advanced book production.

The image also bundles a curated set of fonts, to facilitate high-quality typesetting out of the box.

## Running a released version

Tagged versions are published on the GitHub Container Registry. From the directory containing your document:

```sh
docker run --rm -v "$PWD":/data ghcr.io/omikhleia/resille:1.0.0 document.sil
```

Replace `1.0.0` with the wanted version (or use `latest`).

## Building the image(s)

From the repository root:

```sh
# Default image (redistributable fonts only).
docker build -f build/Dockerfile -t resille .

# Including the non-redistributable fonts; do not publish.
docker build -f build/Dockerfile --build-arg NONFREE_FONTS=true -t resille:nonfree .
```

If downloads fail during the build (DNS, VPN or proxy issues), add `--network=host` to either command.

That is:

```sh
# Default image (redistributable fonts only), with host network.
docker build --network=host -f build/Dockerfile -t resille .

# Including the non-redistributable fonts, with host network; do not publish.
docker build --network=host -f build/Dockerfile --build-arg NONFREE_FONTS=true -t resille:nonfree .
```

## About the name

_Résille_ is French for a fine net, as in a hairnet, fishnet stockings or the lead lattice of a stained-glass window.

It's also a pun on SILE, which it wraps up and holds together with everything else you need to typeset a book.

## Licensing

The build files of this repository (Dockerfile, Makefiles, scripts) are licensed under the [GNU General Public License v3.0](LICENSE).

The image bundles third-party software and fonts, each under its own license. The inventory is in [THIRD-PARTY.md](build/THIRD-PARTY.md).

The default image contains only redistributable fonts. An image built with `NONFREE_FONTS=true` includes fonts that are not redistributable, so it is for personal use only and must not be published.
