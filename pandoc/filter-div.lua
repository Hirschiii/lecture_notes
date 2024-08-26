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
	elseif el.classes:includes("inmargin") then
		return pandoc.RawBlock("context", "\\inmargin{" .. content .. "}")
	else
		local block_name = el.classes[1] or "generic"
		return pandoc.RawBlock("context", "\\start" .. block_name .. "\n" .. content .. "\n\\stop" .. block_name)
	end
end
