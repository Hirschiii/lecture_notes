-- context_block_h5_filter.lua

local in_block = false
local block_title = nil

function Header(el)
	if el.level == 1 then
		local blocks = {}

		-- Wenn bereits ein block läuft, beenden wir ihn
		if in_block then
			table.insert(blocks, pandoc.RawBlock("context", "\\stopblock"))
		end

		-- Start eines neuen blocks mit der aktuellen H5-Überschrift
		in_block = true
		block_title = pandoc.utils.stringify(el.content)
		local start_block = pandoc.RawBlock("context", "\\startblock[title=" .. block_title .. "]")
		table.insert(blocks, start_block)

		-- return blocks
		-- Returning the blocks should not trigger a new block
		return pandoc.List(blocks)
	-- elseif in_block and el.level > 0 and el.level <= 6 then
	-- 	-- Wenn eine andere Überschrift gefunden wird, beenden wir den block
	-- 	in_block = false
	--
	-- 	-- Stop block Befehl einfügen und dann die neue Überschrift zurückgeben
	-- 	local stop_block = pandoc.RawBlock("context", "\\stopblock")
	-- 	return { stop_block, el }
	else
		-- Normale Überschriften oder nicht relevante Überschriften zurückgeben
		return nil
	end
end

function Block(el)
	if in_block then
		return el
	else
		return nil
	end
end

function HorizontalRule(elem)
	-- Replace horizontal rule with a page break
	return pandoc.RawBlock("context", "\\column")
end

function Pandoc(doc)
	-- Beende einen laufenden block, wenn das Dokument endet
	if in_block then
		table.insert(doc.blocks, pandoc.RawBlock("context", "\\stopblock"))
	end
	return doc
end
