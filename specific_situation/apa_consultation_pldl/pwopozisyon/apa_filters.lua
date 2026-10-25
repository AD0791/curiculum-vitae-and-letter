-- Filt pandoc pou PDF la sèlman.
-- 1. Ranplase figi PNG yo (ki sèvi pou .md la) ak vèsyon vektoryèl PDF yo.
-- 2. Lè yon tit swiv pa yon figi oswa yon tablo (touswit oswa apre yon paragraf), mande ase
--    plas pou tit la pa rete poukont li anba yon paj pandan rès la ale sou paj swivan an.
function Image(img)
  if FORMAT:match('latex') and img.src:match('^figures/.+%.png$') then
    img.src = img.src:gsub('%.png$', '.pdf')
  end
  return img
end

function Pandoc(doc)
  if not FORMAT:match('latex') then return doc end
  local out = {}
  for i, b in ipairs(doc.blocks) do
    if b.t == 'Header' then
      -- Blòk ki vin apre tit la ; si se yon paragraf, gade blòk ki swiv paragraf la.
      local nxt = doc.blocks[i + 1]
      if nxt and nxt.t == 'Para' then nxt = doc.blocks[i + 2] end
      if nxt and nxt.t == 'Figure' then
        table.insert(out, pandoc.RawBlock('latex', '\\apaneedspace{0.25\\textheight}'))
      elseif nxt and nxt.t == 'Table' then
        table.insert(out, pandoc.RawBlock('latex', '\\apaneedspace{0.12\\textheight}'))
      end
    end
    table.insert(out, b)
  end
  doc.blocks = out
  return doc
end
