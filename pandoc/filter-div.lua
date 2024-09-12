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
	elseif el.classes:includes("math") then
		local title = el.attributes["title"]
		local reference = el.attributes["reference"]
		return pandoc.RawBlock(
			"context",
			"\\startplaceformula[list={"
				.. title
				.. "},reference="
				.. reference
				.. "]\n\\startformula\n"
				.. content
				.. "\n\\stopformula\\stopplaceformula"
		)
	else
		local block_name = el.classes[1] or "generic"
		return pandoc.RawBlock("context", "\\start" .. block_name .. "\n" .. content .. "\n\\stop" .. block_name)
	end
end
