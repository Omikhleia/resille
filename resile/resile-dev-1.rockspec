rockspec_format = "3.0"
package = "resile"
version = "dev-1"

source = {
  url = "git+https://github.com/Omikhleia/resille.git",
}

description = {
  summary = "Resille overrides for SILE",
  detailed = [[
    The "resile" collection contains modified SILE components used by the "resille" image.
  ]],
  homepage = "https://github.com/Omikhleia/resille",
  license = "GPL-3.0",
}

build = {
  type = "builtin",
  modules = {
    ["sile.outputters.libtexpdf"] = "resile/outputters/libtexpdf.lua",
    ["sile.packages.folio"] = "resile/packages/folio/init.lua",
  },
}
