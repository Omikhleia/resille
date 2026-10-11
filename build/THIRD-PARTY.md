# Third-party software and fonts

The Docker image built from [`Dockerfile`](Dockerfile) bundles third-party software and fonts.

Each component keeps its own license. The license of this repository covers only the build files (Dockerfile, Makefiles, scripts, etc.), not the contents of the image.

The inventory below lists the third-party software and fonts included in the image. It is informational, not legal advice.

## Main software

| Component | Version in image | License | Notes |
|---|---|---|---|
| SILE | 0.15.13 (via PPA) | MIT (core). Some bundled components use other licenses: OFL-1.1, GPL-2+ and others. | See "Components bundled in SILE" below. |
| Inkscape | 1.2.2 | GNU GPL (some portions public domain) | - |
| LilyPond | 2.24.3 | GPL-2+, GPL-3, GPL-3+; also GFDL-1.3+, LPPL-1.3c+, OFL-1.1, BSL-1.0, Expat | - |
| Ghostscript | 10.02.1 | AGPL-3, AGPL-3+; also FTL, Apache-2.0, BSD-3-Clause, Expat, GPL-2+/3+ | Network-use clause of the AGPL applies to the Ghostscript code. |
| GraphicsMagick | 1.3.42 | Various (MIT and other OSI-approved licenses) | - |
| Graphviz | 13.1.2 | Eclipse Public License | Only `graphviz` and `libgraphviz4` are installed. |
| Git | 2.43.0 | GPL-2, GPL-2+, LGPL-2+/2.1+, plus several permissive licenses | - |
| LuaJIT | 2.1 | MIT/X | - |
| LuaRocks | 3.8.0 | MIT (Expat) | - |

### Ubuntu base and other packages

Ubuntu base and other packages are installed from the official Ubuntu repositories. Their licenses are as stated in the respective packages.

### Components bundled in SILE

This might not be a complete list of all components bundled in SILE; it covers the main ones relevant for licensing purposes.

SILE comes from a PPA, so its source is in the PPA's source package on Launchpad.

| Component | Shipped as | License |
|---|---|---|
| libtexpdf | `libtexpdf.so` and headers | GPL-2+ (derived from dvipdfmx) |
| imagesize | `lua-libraries/imagesize.lua` | Artistic-2.0 or LGPL, at your choice |
| char-def | `lua-libraries/char-def.lua` | ConTeXt, with data from the Unicode Consortium's UNIDATA |

## Rocks

Installed with LuaRocks, license as declared in each rock's metadata.

| Rock | License |
|---|---|
| barcodes.sile | MIT |
| bit32 | MIT |
| cassowary | Apache 2 |
| cldr | MIT/ICU |
| compat53 | MIT |
| couyards.sile | MIT |
| embedders.sile | MIT |
| fluent | MIT |
| grail | MIT |
| highlighter.sile | MIT |
| labelrefs.sile | MIT |
| linenoise | MIT/X11 |
| loadkit | MIT |
| lpeg | MIT/X11 |
| lua-zlib | MIT |
| lua_cliargs | MIT |
| luaepnf | MIT |
| luaexpat | MIT/X11 |
| luafilesystem | MIT/X11 |
| luarepl | MIT/X11 |
| luasec | MIT |
| luasocket | MIT |
| luautf8 | MIT |
| lunajson | MIT/X11 |
| mimetypes | MIT/X11 |
| penlight | MIT/X11 |
| piecharts.sile | MIT |
| ptable.sile | MIT |
| qrcode.sile | BSD 3-clause |
| resilient.sile | MIT |
| rough | MIT |
| sha1 | MIT |
| smartquotes.sile | MIT |
| textsubsuper.sile | MIT |
| vstruct | MIT-compatible |

## Fonts

### Redistributable

| Font | Copyright holder | License |
|---|---|---|
| Amiri | The Amiri Project Authors | SIL OFL 1.1 |
| Chomsky | Fredrick R. Brennan | SIL OFL 1.1 |
| Cormorant (Infant) | The Cormorant Project Authors | SIL OFL 1.1 |
| EB Garamond | Georg A. Duffner | SIL OFL 1.1 |
| KJV1611 | Fredrick R. Brennan | SIL OFL 1.1 |
| Lato | tyPoland Lukasz Dziedzic (Reserved Font Name "Lato") | SIL OFL 1.1 |
| Libertinus | The Libertinus Project Authors | SIL OFL 1.1 |
| Mynerve | The Mynerve Project Authors | SIL OFL 1.1 |
| Hack | Source Foundry Authors; Bitstream, Inc. (DejaVu/Vera base) | MIT, with the Bitstream Vera license for the inherited work |
| Zallman Caps | Dieter Steffmann (**) | Free (*) |
| Caslon Antique | Dieter Steffmann | Free (*) |
| DS Zierschrift | Dieter Steffmann | Free (*) |
| Gingerbread Initials | Dieter Steffmann | Free (*) |


(*) "Free" refers to the author's statement on 1001Fonts, dated 2015-01-21:

> "I am giving out my fonts to everyone for free for commercial purposes without any restrictions."

These fonts are included in good faith, in line with the author's stated intent. Older terms that may appear in the font files or on third-party sites predate this statement.

(**) Zallman Caps is derived from a design by D. Rakowski (1991). Only the license on Dieter Steffmann's work is considered here.

### Not redistributable

These fonts are not redistributable according to their respective licenses, and are not part of the base installation.

| Font | Copyright holder | License |
|---|---|---|
| Symbola | Unicode Fonts for Ancient Scripts (UFAS) | "Free use of UFAS is strictly limited to personal use." |
| Ulfilas II | Robert Pfeffer | "Free for non-commercial use." |
