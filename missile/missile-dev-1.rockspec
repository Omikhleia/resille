rockspec_format = "3.0"
package = "missile"
version = "dev-1"

source = {
  url = "git+https://github.com/Omikhleia/resille.git",
}

description = {
  summary = "Updated SILE components for Resille",
  detailed = [[
    The "missile" collection provides updated SILE components from the
    missile/sile submodule, relative to SILE 0.15.13.
  ]],
  homepage = "https://github.com/Omikhleia/resille",
  license = "MIT",
}

build = {
  type = "builtin",
  modules = {
    ["sile.classes.base"] = "missile/sile/classes/base.lua",
    ["sile.core.font"] = "missile/sile/core/font.lua",
    ["sile.core.frame"] = "missile/sile/core/frame.lua",
    ["sile.core.opentype-parser"] = "missile/sile/core/opentype-parser.lua",
    ["sile.core.sile"] = "missile/sile/core/sile.lua",
    ["sile.languages.cs.init"] = "missile/sile/languages/cs/init.lua",
    ["sile.languages.es.init"] = "missile/sile/languages/es/init.lua",
    ["sile.languages.gl.init"] = "missile/sile/languages/gl/init.lua",
    ["sile.languages.hr.init"] = "missile/sile/languages/hr/init.lua",
    ["sile.languages.kk.hyphens-tex"] = "missile/sile/languages/kk/hyphens-tex.lua",
    ["sile.languages.kk.init"] = "missile/sile/languages/kk/init.lua",
    ["sile.languages.oc-aranes.init"] = "missile/sile/languages/oc-aranes/init.lua",
    ["sile.languages.oc.init"] = "missile/sile/languages/oc/init.lua",
    ["sile.languages.pl.init"] = "missile/sile/languages/pl/init.lua",
    ["sile.languages.pt.init"] = "missile/sile/languages/pt/init.lua",
    ["sile.languages.sk.init"] = "missile/sile/languages/sk/init.lua",
    ["sile.languages.unicode.init"] = "missile/sile/languages/unicode/init.lua",
    ["sile.packages.base"] = "missile/sile/packages/base.lua",
    ["sile.packages.bibtex.csl.csl_spec"] = "missile/sile/packages/bibtex/csl/csl_spec.lua",
    ["sile.packages.bibtex.csl.engine"] = "missile/sile/packages/bibtex/csl/engine.lua",
    ["sile.packages.bibtex.csl.locale"] = "missile/sile/packages/bibtex/csl/locale.lua",
    ["sile.packages.bibtex.csl.processor"] = "missile/sile/packages/bibtex/csl/processor.lua",
    ["sile.packages.bibtex.csl.style"] = "missile/sile/packages/bibtex/csl/style.lua",
    ["sile.packages.bibtex.csl.utils.casing"] = "missile/sile/packages/bibtex/csl/utils/casing.lua",
    ["sile.packages.bibtex.csl.utils.superfolding"] = "missile/sile/packages/bibtex/csl/utils/superfolding.lua",
    ["sile.packages.bibtex.csl.utils.xmlparser"] = "missile/sile/packages/bibtex/csl/utils/xmlparser.lua",
    ["sile.packages.bibtex.init"] = "missile/sile/packages/bibtex/init.lua",
    ["sile.packages.bibtex.support.bib2csl"] = "missile/sile/packages/bibtex/support/bib2csl.lua",
    ["sile.packages.bibtex.support.bibparser"] = "missile/sile/packages/bibtex/support/bibparser.lua",
    ["sile.packages.boustrophedon.init"] = "missile/sile/packages/boustrophedon/init.lua",
    ["sile.packages.dropcaps.init"] = "missile/sile/packages/dropcaps/init.lua",
    ["sile.packages.indexer.init"] = "missile/sile/packages/indexer/init.lua",
    ["sile.packages.lists.init"] = "missile/sile/packages/lists/init.lua",
    ["sile.packages.math.base-elements"] = "missile/sile/packages/math/base-elements.lua",
    ["sile.packages.math.init"] = "missile/sile/packages/math/init.lua",
    ["sile.packages.math.menclose-notations"] = "missile/sile/packages/math/menclose-notations.lua",
    ["sile.packages.math.texlike"] = "missile/sile/packages/math/texlike.lua",
    ["sile.packages.math.typesetter"] = "missile/sile/packages/math/typesetter.lua",
    ["sile.packages.retrograde.init"] = "missile/sile/packages/retrograde/init.lua",
    ["sile.packages.tableofcontents.init"] = "missile/sile/packages/tableofcontents/init.lua",
    ["sile.types.unit"] = "missile/sile/types/unit.lua",
    ["sile.typesetters.base"] = "missile/sile/typesetters/base.lua",
  },
  install = {
    lua = {
      ["sile.languages.en.messages"] = "missile/sile/languages/en/messages.ftl",
      ["sile.languages.eo.messages"] = "missile/sile/languages/eo/messages.ftl",
      ["sile.languages.fr.messages"] = "missile/sile/languages/fr/messages.ftl",
      ["sile.languages.gl.messages"] = "missile/sile/languages/gl/messages.ftl",
      ["sile.languages.kk.messages"] = "missile/sile/languages/kk/messages.ftl",
      ["sile.languages.la.messages"] = "missile/sile/languages/la/messages.ftl",
      ["sile.languages.nb.messages"] = "missile/sile/languages/nb/messages.ftl",
      ["sile.languages.nn.messages"] = "missile/sile/languages/nn/messages.ftl",
      ["sile.languages.oc-aranes.messages"] = "missile/sile/languages/oc-aranes/messages.ftl",
      ["sile.languages.oc.messages"] = "missile/sile/languages/oc/messages.ftl",
      ["sile.languages.pt.messages"] = "missile/sile/languages/pt/messages.ftl",
      ["sile.languages.ru.messages"] = "missile/sile/languages/ru/messages.ftl",
      ["sile.languages.sv.messages"] = "missile/sile/languages/sv/messages.ftl",
      ["sile.languages.tr.messages"] = "missile/sile/languages/tr/messages.ftl",
      ["sile.languages.und.messages"] = "missile/sile/languages/und/messages.ftl",
    },
  },
}
