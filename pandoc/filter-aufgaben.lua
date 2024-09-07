package.path = package.path .. ";" .. os.getenv("HOME") .. "/git/lecture_notes/pandoc/?.lua"

require("filter-cite")
require("filter-pararef")
require("filter-pararef-h5")
require("filter-div")
require("filter-hr")
