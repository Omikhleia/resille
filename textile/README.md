# textile

Textile /ˈtɛkstaɪl/ (“material made of interlacing or matted fibres”) is a PDF generation library with Lua bindings, based on the `dvipdfm-x` code of TeX Live 2026.1.

It descends from SILE's libtexpdf (dating from 2014), which attempted to turn `dvipdfm-x` into a stateless library. That approach could not be made general, and Textile abandons the idea entirely. The vendored `dvipdfm-x` code therefore needs very few changes, and each one is marked with `BEGIN LIBTEXPDF PATCH` / `END LIBTEXPDF PATCH` comments. The C API is consequently different from SILE's libtexpdf.

The Lua bindings (`justenoughlibtexpdf`) are a drop-in replacement: SILE's Lua code, including the PDF outputter, works with them unmodified, though the internal implementation differs substantially.

The name is obviously a play on TeX and SILE.

## Benefits

- **More recent**: based on the `dvipdfm-x` code of TeX Live 2026.1 rather than a 2014 snapshot, so upstream improvements and fixes come along. This includes PDF 1.7 support, enhanced font handling, and other modern features.
- **Easier to maintain**: the vendored code needs very few changes, all marked with `LIBTEXPDF PATCH` comments, which makes comparison with upstream versions straightforward, now that the stateless approach is dropped.
- **Drop-in replacement**: the Lua bindings work with SILE's Lua code nearly unmodified. The only removed method is `imagebbox`, which is superseded by the independent image helper.

## License

The new `libtexpdf` and its accompanying `justenoughlibtexpdf` Lua bindings are licensed under the GNU General Public License v3.0.

The original `dvipdfm-x` is licensed under the GNU General Public License v2.0 or later.
