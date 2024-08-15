-- context_paragraph_filter.lua

function Div(el)
	-- Check if the div has an attribute `reference` and `title`
	local reference = el.attributes["reference"]
	local title = el.attributes["title"]

	if reference and title then
		-- Convert the div into a ConTeXt startParagraph and stopParagraph
		local start_paragraph =
			pandoc.RawBlock("context", "\\startParagraph[reference=" .. reference .. ",title=" .. title .. "]")
		local stop_paragraph = pandoc.RawBlock("context", "\\stopParagraph")

		-- Insert the start and stop commands around the content of the div
		table.insert(el.content, 1, start_paragraph)
		table.insert(el.content, stop_paragraph)

		return el.content
	end
end
