-- Chan pou ranpli yo (`[...]` nan .md la).
-- PDF : chan siyati yo vin yon kare vid ak yon mak blan (build la mete chan siyati elektwonik la
-- sou mak sa a) ; lòt chan yo nan tablo siyati a vin chan fòm PDF moun ka ranpli ; tout lòt
-- chan yo parèt sou fon jòn APA a.
-- Word : fon jòn pou tout, ak yon liy pou siyati yo.
local fields = {
  ['[Non reprezantan APA]'] = 'ApaNon',
  ['[Fonksyon]'] = 'ApaFonksyon',
  ['[Dat APA]'] = 'ApaDat',
  ['[Dat konsiltan]'] = 'KonsiltanDat',
}
local sigs = {
  ['[Siyati APA]'] = 'SIGMARKAPA',
  ['[Siyati konsiltan]'] = 'SIGMARKKONSILTAN',
}

function Code(c)
  if not c.text:match('^%[.*%]$') then return nil end
  if FORMAT:match('latex') then
    -- Siyati konsiltan an : imaj li (kontra/siyati.local.png, gitignore) si li la, nan PDF la sèlman.
    if c.text == '[Siyati konsiltan]' and io.open('siyati.local.png', 'r') then
      return pandoc.RawInline('latex', '\\raisebox{-0.5cm}{\\fcolorbox{apagray!45}{white}{' ..
        '\\parbox[b][1.3cm][c]{5.4cm}{\\centering\\includegraphics[height=1.05cm,width=5cm,' ..
        'keepaspectratio]{siyati.local.png}}}}')
    end
    if sigs[c.text] then
      return pandoc.RawInline('latex', '\\raisebox{-0.5cm}{\\fcolorbox{apagray!45}{white}{' ..
        '\\parbox[b][1.3cm][b]{5.4cm}{\\tiny\\color{white}' .. sigs[c.text] .. '}}}')
    end
    if fields[c.text] then
      return pandoc.RawInline('latex', '\\begin{Form}\\TextField[name=' .. fields[c.text] ..
        ', width=5.6cm, height=0.5cm, charsize=9pt, bordercolor={0.84 0.85 0.88},' ..
        ' backgroundcolor={1 0.96 0.78}]{}\\end{Form}')
    end
    local t = c.text:gsub('([&%%#_])', '\\%1')
    return pandoc.RawInline('latex', '\\colorbox{apayellow!55}{\\strut ' .. t .. '}')
  elseif FORMAT:match('docx') then
    if sigs[c.text] then
      return pandoc.Str('\u{a0}\n\n________________________')
    end
    return pandoc.Span(pandoc.Str(c.text), {['custom-style'] = 'Chan pou ranpli'})
  end
  return pandoc.Str(c.text)
end
