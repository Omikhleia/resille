# missile

Missile /ˈmɪsaɪl/ (“an object sent through the air”) packages selected Lua module and Fluent translation updates from the [SILE submodule](sile) since SILE **v0.15.13**.

The name is obviously a play on SILE and the missing updates it brings along.

## License

The SILE code included in missile is generally licensed under the [MIT License](sile/LICENSE.md).
Some files contain third-party data and retain their own copyright and license notices.

## Changes to SILE 0.15.13

Paths below are relative to the SILE submodule.

### Core and classes

| Lua file | Changes since v0.15.13 |
|---|---|
| `classes/base.lua` | Fix typos in comments and a warning. |
| `core/font.lua` | Use `ex` and `cap` measurements for font adjustment; change the default font to Gentium Book. |
| `core/frame.lua` | Fix a typo in a comment. |
| `core/opentype-parser.lua` | Parse more fields and versions of the OpenType OS/2 table, including x-height and cap-height metrics. |
| `core/sile.lua` | Fix a typo in a comment. |
| `types/unit.lua` | Improve `ex` measurement using font metrics and fallbacks; add the `cap` unit. |
| `typesetters/base.lua` | Fix a typo in a debug message. |

### Languages

| Lua file | Changes since v0.15.13 |
|---|---|
| `languages/cs/init.lua` | Use the shared repeated-hyphen feature for Czech. |
| `languages/es/init.lua` | Use the shared repeated-hyphen feature for Spanish. |
| `languages/gl/init.lua` | Add a Galician node maker with repeated-hyphen behavior. |
| `languages/hr/init.lua` | Use the shared repeated-hyphen feature for Croatian. |
| `languages/kk/hyphens-tex.lua` | Add Kazakh hyphenation patterns. |
| `languages/kk/init.lua` | Add Kazakh hyphenation registration. |
| `languages/oc-aranes/init.lua` | Add Aranese using Occitan hyphenation patterns. |
| `languages/oc/init.lua` | Use French-style punctuation spacing for Occitan. |
| `languages/pl/init.lua` | Use the shared repeated-hyphen feature for Polish. |
| `languages/pt/init.lua` | Use the shared repeated-hyphen feature for Portuguese. |
| `languages/sk/init.lua` | Use the shared repeated-hyphen feature for Slovak. |
| `languages/unicode/init.lua` | Integrate repeated-hyphen handling into word and line breaking. |

### Bibliography

| Lua file | Changes since v0.15.13 |
|---|---|
| `packages/bibtex/csl/csl_spec.lua` | Update the CSL test expectation for bibliography paragraph wrappers. |
| `packages/bibtex/csl/engine.lua` | Improve sorting, substitution, state handling, ordinal folding and quotation handling; support related entries and bibliography formatting options. |
| `packages/bibtex/csl/locale.lua` | Support superscript folding in ordinal terms and improve documentation. |
| `packages/bibtex/csl/processor.lua` | Add the extracted CSL processor, including bibliography filtering, related entries, citation aliases and HTML export. |
| `packages/bibtex/csl/style.lua` | Update API documentation. |
| `packages/bibtex/csl/utils/casing.lua` | Expand casing API documentation. |
| `packages/bibtex/csl/utils/superfolding.lua` | Improve documentation and references. |
| `packages/bibtex/csl/utils/xmlparser.lua` | Improve parser documentation. |
| `packages/bibtex/init.lua` | Use the extracted CSL processor, remove legacy bibliography support, and add filtering, related-entry and formatting options. |
| `packages/bibtex/support/bib2csl.lua` | Stop assigning citation numbers during BibTeX-to-CSL conversion. |
| `packages/bibtex/support/bibparser.lua` | Handle comma-separated fields, citation aliases, related entries and `nocite` entries. |

### Math

| Lua file | Changes since v0.15.13 |
|---|---|
| `packages/math/base-elements.lua` | Add MathML enclosure and color handling; fix math sizing, cramping, delimiters and accents. |
| `packages/math/init.lua` | Adjust math font size to the current document font. |
| `packages/math/menclose-notations.lua` | Add notation definitions for MathML `menclose`. |
| `packages/math/texlike.lua` | Add roots with degrees and boxed/cancel commands; fix table and accent handling. |
| `packages/math/typesetter.lua` | Pass MathML attributes through and support enclosures and cramping adjustments. |

### Other packages

| Lua file | Changes since v0.15.13 |
|---|---|
| `packages/base.lua` | Fix a typo in a comment. |
| `packages/boustrophedon/init.lua` | Update the documentation example to use Gentium Book. |
| `packages/dropcaps/init.lua` | Update a font reference in a comment. |
| `packages/indexer/init.lua` | Fix empty-page detection and comparison of consecutive index pages. |
| `packages/lists/init.lua` | Update a font reference in the documentation. |
| `packages/retrograde/init.lua` | Restore older defaults only when the current value is still the newer default; include the font default change. |
| `packages/tableofcontents/init.lua` | Cast table-of-contents levels to integers. |
