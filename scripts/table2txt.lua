package.path = '../?.lua;'..package.path
local keywords = require 'dict/macports-keywords'

local size = 0
for _ in pairs(keywords) do
    size = size + 1
end

local dict = {}

local i = 0
while i < size do
    i = i + 1

    local keyword, group
    keyword   = keywords[i].id
    group     = keywords[i].gr

    if (group == 'mpKeywords') then
        table.insert(dict, keyword)
    end
end

local file = io.open('dict/macports-keywords.txt', 'w')
io.output(file)
io.write(table.concat(dict,' '))
io.close(file)
