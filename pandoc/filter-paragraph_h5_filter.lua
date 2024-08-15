-- context_paragraph_h5_filter.lua

local in_paragraph = false
local paragraph_title = nil

function Header(el)
	if el.level == 5 then
		local blocks = {}

		-- Wenn bereits ein Paragraph läuft, beenden wir ihn
		if in_paragraph then
			table.insert(blocks, pandoc.RawBlock("context", "\\stopParagraph"))
		end

		-- Start eines neuen Paragraphs mit der aktuellen H5-Überschrift
		in_paragraph = true
		paragraph_title = pandoc.utils.stringify(el.content)
		local start_paragraph = pandoc.RawBlock(
			"context",
			"\\startParagraph{reference=" .. paragraph_title .. ",title=" .. paragraph_title .. "}"
		)
		table.insert(blocks, start_paragraph)

		-- return blocks
		-- Returning the blocks should not trigger a new paragraph
		return pandoc.List(blocks)
	elseif in_paragraph and el.level > 0 and el.level <= 6 then
		-- Wenn eine andere Überschrift gefunden wird, beenden wir den Paragraph
		in_paragraph = false

		-- Stop Paragraph Befehl einfügen und dann die neue Überschrift zurückgeben
		local stop_paragraph = pandoc.RawBlock("context", "\\stopParagraph")
		return { stop_paragraph, el }
	else
		-- Normale Überschriften oder nicht relevante Überschriften zurückgeben
		return nil
	end
end

function Block(el)
	if in_paragraph then
		return el
	else
		return nil
	end
end

function Pandoc(doc)
	-- Beende einen laufenden Paragraph, wenn das Dokument endet
	if in_paragraph then
		table.insert(doc.blocks, pandoc.RawBlock("context", "\\stopParagraph"))
	end
	return doc
end
