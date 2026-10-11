# ---------- BASE STAGE (SHARED BY OTHER STAGES) ----------
# Noble Numbat (LTS, supported until 2029)
FROM ubuntu:24.04 AS ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

# ---------- BUILD STAGE ----------
FROM ubuntu-base AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
        # SYSTEM TOOLS
        # - ca-certificates: to ensure secure connections
        # - software-properties-common: to manage PPAs (and have add-apt-repository)
        ca-certificates \
        software-properties-common \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        # LUAJIT
        # - luajit: the pinned version of SILE uses it, so we want it too for consistency
        luajit \
        # DEPENDENCIES NEEDED BY RESILIENT.SILE (see documentation)
        # except graphiz see below (Problem 1)
        graphicsmagick \
        ghostscript \
        inkscape \
        lilypond \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Problem 1:
# The version of graphviz in the Ubuntu 24.x repositories is VERY old...
# So we go for a custom installation of a pinned version of Graphviz 13.1.2.
# We need the universe repository for some dependencies of graphviz.
# The archive also has docs, development packages, language bindings, and debug symbols:
# we only need the core binaries for our purposes.
# curl and xz-utils are temporary here: we remove them in this same layer after unpacking.
RUN . /etc/os-release \
 && add-apt-repository universe \
 && apt-get update \
 && apt-get install -y --no-install-recommends curl xz-utils \
 && curl -fSL "https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/13.1.2/ubuntu_${VERSION_ID}_graphviz-13.1.2-debs.tar.xz" \
      -o graphviz.tar.xz \
 && tar -xJf graphviz.tar.xz \
 && apt-get install -y --no-install-recommends \
         ./graphviz_13.1.2-1_amd64.deb \
         ./libgraphviz4_13.1.2-1_amd64.deb \
 && apt-get purge -y curl xz-utils \
 && apt-get clean && rm -rf /var/lib/apt/lists/* graphviz.tar.xz ./*.deb ./*.ddeb \
 # Verify installation
 && dot -V

# ---------- FONTS STAGE ----------
FROM ubuntu-base AS fonts

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        # - curl: for fetching font files in the Makefile-fonts,
        curl \
        # - libarchive-tools: for 'bsdtar' compatibility (used in the Makefile-fonts)
        libarchive-tools \
        # - make: for the font Makefiles
        make \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add curated set of decent fonts for examples
# The makefile will download and install them in .fonts/
COPY ./build/Makefile-fonts ./
RUN make -f Makefile-fonts allfonts
COPY ./build/Makefile-extra-fonts ./
RUN make -f Makefile-extra-fonts allfonts

# ---------- STAGE SILE ----------
FROM build AS sile

# Add the SILE PPA repository and install SILE
# software-properties-common is needed to manage PPAs (and have add-apt-repository)
# SILE is then pinned to version 0.15.13
RUN . /etc/os-release \
 && add-apt-repository ppa:sile-typesetter/sile \
 && apt-get update && apt-get install -y sile=0.15.13-1ppa1~ubuntu${VERSION_ID} \
 && apt-get clean && rm -rf /var/lib/apt/lists/* \
 # Verify installation
 # For reference I got: SILE v0.15.13 (LuaJIT 2.1.1703358377) [Rust]
 && sile --version

# ---------- BUILD LUAROCKS PACKAGES ----------
FROM sile AS rocks

RUN apt-get update && apt-get install -y --no-install-recommends \
        # - luarocks: needed to install resilient.sile and its dependencies
        luarocks \
        # - git: needed by luarocks to fetch some packages
        git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Check the Lua version used by SILE and set it as the default for LuaRocks
RUN sile -q -e 'print(SILE.lua_version); os.exit()' > /tmp/LVER \
 && luarocks config lua_version $(cat /tmp/LVER) \
 # Verify
 && luarocks list

# Problem 2:
# We would expect here to see all Lua dependencies used by SILE,
# but they don't show up.
# With an Arch Linux base image, it worked...
# Worse, some dependencies seem old (e.g. lpeg 1.0.2)...
# So enforce installation of the dependencies in versions needed by SILE.
# Some will need compilation, and development headers...
# The compiler (needed by some low-level rocks) and development headers
# stay in this stage only.
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libexpat1-dev \
        libssl-dev \
 && apt-get clean && rm -rf /var/lib/apt/lists/* \
 && luarocks install --only-deps --dev sile \
 && luarocks list

# Resilient packages and classes for SILE
# Yay, at last!
RUN luarocks install resilient.sile && luarocks list

# ---------- RUNTIME IMAGE ----------
FROM sile AS runtime

# Copy installed LuaRocks packages without the compiler toolchain.
COPY --from=rocks /usr/local /usr/local

COPY --from=fonts /workspace/.fonts /.fonts

WORKDIR /data
ENTRYPOINT ["sile"]
