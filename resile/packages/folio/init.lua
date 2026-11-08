local base = require("packages.base")

local package = pl.class(base)
package._name = "folio"

function package:incrementFolio ()
   self._counter.value = self._counter.value + 1
end

function package:outputFolio (frame)
   if not frame then
      frame = "folio"
   end
   local folio = self.class.packages.counters:formatCounter(self._counter)
   if self._pageLabels then
      self._pageLabels[self._pageIndex] = self._counter.value > 0 and folio or "-"
   end
   if not SILE.quiet then
      io.stderr:write("[" .. folio .. "] ")
   end
   if self._counter.off then
      if self._counter.off == 2 then
         self._counter.off = false
      end
   else
      local folioFrame = SILE.getFrame(frame)
      if folioFrame then
         SILE.typesetNaturally(folioFrame, function ()
            SILE.settings:pushState()
            -- Restore the settings to the top of the queue, which should be the document #986
            SILE.settings:toplevelState()

            -- Reset settings the document may have but should not be applied to footnotes
            -- See also same resets in footnote package
            for _, v in ipairs({
               "current.hangAfter",
               "current.hangIndent",
               "linebreak.hangAfter",
               "linebreak.hangIndent",
            }) do
               SILE.settings:set(v, SILE.settings.defaults[v])
            end

            SILE.call("foliostyle", {}, { folio })
            SILE.typesetter:leaveHmode()
            SILE.settings:popState()
         end)
      end
   end
end

function package:_init (options)
   base._init(self)
   self:loadPackage("counters")
   -- Create and initialize the folio counter
   self._counter = self.class:getCounter("folio")
   self._counter.value = 1 -- default is 0 (and arabic numbering)
   self._counter.format = nil -- HACK, API unclear here and pointer leaking in the indexer

   if SILE.outputter.writePageLabels then
      self._pageIndex = 1
      self._pageLabels = {}
      SILE.outputter:registerHook("prefinish", function (outputter)
         outputter:writePageLabels(self._pageLabels, self._pageIndex)
      end)
   end

   self.class:registerHook("newpage", function ()
      self:incrementFolio()
      if self._pageLabels then
         self._pageIndex = self._pageIndex + 1
      end
   end)
   self.class:registerHook("endpage", function ()
      self:outputFolio(options and options.frame)
   end)
   self:export("outputFolio", self.outputFolio)
end

function package:registerCommands ()
   self:registerCommand("folios", function (_, _)
      self._counter.off = false
   end)

   self:registerCommand("nofolios", function (_, _)
      self._counter.off = true
   end)

   self:registerCommand("nofoliothispage", function (_, _)
      self._counter.off = 2
   end)

   self:registerCommand("nofoliosthispage", function (_, _)
      SU.deprecated("nofoliosthispage", "nofoliothispage", "0.12.1", "0.14.0")
   end, "Deprecated")

   self:registerCommand("foliostyle", function (_, content)
      SILE.call("center", {}, content)
   end)
end

package.documentation = [[
\begin{document}
The \autodoc:package{folio} package (which is automatically loaded by the \autodoc:class{plain} class, and therefore by nearly every SILE class) controls the output of folios—the old-time typesetter word for page numbers.

It provides four commands to users:

\begin{itemize}
\item{\autodoc:command{\nofolios}: turns page numbers off.}
\item{\autodoc:command{\nofoliothispage}: turns page numbers off for one page, then on again afterward.}
\item{\autodoc:command{\folios}: turns page numbers back on.}
\item{\autodoc:command{\foliostyle}: a command you can override to style the page numbers. By default, they are centered on the page.}
\end{itemize}

If, for instance, you want to set page numbers in a different font you can redefine the command like so:

\begin[type=autodoc:codeblock]{raw}
\define[command=foliostyle]{\center{\font[family=Albertus]{\process}}}
\end{raw}

If you want to put page numbers on the left side of even pages and the right side of odd pages, there are a couple of ways you can do that.
The complicated way is to define a command in Lua which inspects the page number and then sets the number ragged left or ragged right appropriately.
The easy way is just to put your folio frame where you want it on the master page.
\end{document}
]]

return package
