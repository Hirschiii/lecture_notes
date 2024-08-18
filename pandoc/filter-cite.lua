-- context_cite_filter.lua

function Cite(citations)
	local result = {}
	for _, cite in ipairs(citations.citations) do
		-- Extract the citation key and suffix
		local citation_key = cite.id
		local suffix = ""
		if cite.suffix then
			suffix = pandoc.utils.stringify(cite.suffix)
		end

		-- Construct the ConTeXt \cite command
		-- table.insert(result, pandoc.RawInline("context", "\\crossref[" .. citation_key .. "]"))
		-- table.insert(result, pandoc.RawInline("context", "\\cite[" .. citation_key .. "]"))
		table.insert(
			result,
			pandoc.RawInline("context", "\\footnote{\\cite[alternative=entry][" .. citation_key .. "]}")
		)
	end

	return result
end
