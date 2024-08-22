function Div(el)
	local content = pandoc.write(pandoc.Pandoc(el.content), "context")

	if el.classes:includes("example") then
		return pandoc.RawBlock("context", "\\startexampletext\n" .. content .. "\n\\stopexampletext")
	elseif el.classes:includes("alert") then
		return pandoc.RawBlock("context", "\\startalerttext\n" .. content .. "\n\\stopalerttext")
	elseif el.classes:includes("block") then
		return pandoc.RawBlock("context", "\\startblocktext\n" .. content .. "\n\\stopblocktext")
	elseif el.classes:includes("leftbar") then
		return pandoc.RawBlock("context", "\\startleftbartext\n" .. content .. "\n\\stopleftbartext")
	else
		return el
	end
end
