function HorizontalRule(el)
	-- Return the ConTeXt command for horizontal rule
	return pandoc.RawBlock("context", "\\textpartdivider")
end
