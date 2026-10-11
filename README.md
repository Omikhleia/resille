# resille

[![Version](https://img.shields.io/github/v/tag/Omikhleia/resille?label=ghcr&logo=docker)](https://github.com/Omikhleia/resille/pkgs/container/resille)
[![Build](https://github.com/Omikhleia/resille/actions/workflows/docker-tag-publish.yml/badge.svg)](https://github.com/Omikhleia/resille/actions/workflows/docker-tag-publish.yml)
[![License](https://img.shields.io/github/license/Omikhleia/resille)](LICENSE)

This is _résille_ (pronounced /ʁe.zij/), a Docker-based digital typesetting system.

It bundles the [SILE typesetting system](https://sile-typesetter.org/), the [_re·sil·ient_](https://github.com/Omikhleia/resilient.sile) collection of modules for advanced document and book production, the tools they rely on, additional components, and a curated set of fonts.

It is for anyone who wants to typeset documents or books with a ready-to-use environment for high-quality typesetting, without needing to install anything on the host system.

Packaging all of this for every host system and Linux distribution is difficult, so a container is used instead. The only prerequisite is Docker or a compatible container runtime.

## Running a released version

Tagged versions are published on the GitHub Container Registry. Pull the image:

```sh
docker pull ghcr.io/omikhleia/resille:latest
```

Replace `latest` with a specific version to pin it.

Then define an alias...

```sh
alias resille='docker run -it --rm --volume "$(pwd):/data" --user "$(id -u):$(id -g)" ghcr.io/omikhleia/resille:latest -e "require('"'"'resilient.bootstrap'"'"')"'
```

And use it, from the directory containing your document, as follows:

```sh
resille book/book.silm
```

## Building local image(s)

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

## Example

A small sample document, generated with the image itself, is attached as a PDF to each [release](https://github.com/Omikhleia/resille/releases/latest).

## About the name

_Résille_ is French for a fine net, as in a hairnet, fishnet stockings or the lead lattice of a stained-glass window.

It's also a pun on SILE, which it wraps up and holds together with everything else you need to typeset a book.

## Licensing

The build files of this repository (Dockerfile, Makefiles, scripts) are licensed under the [GNU General Public License v3.0](LICENSE).

The image bundles third-party software and fonts, each under its own license. The inventory is in [THIRD-PARTY.md](build/THIRD-PARTY.md).

The default image contains only redistributable fonts. An image built with `NONFREE_FONTS=true` includes fonts that are not redistributable, so it is for personal use only and must not be published.
