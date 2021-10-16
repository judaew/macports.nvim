local api = vim.api

if (vim.b.current_syntax ~= nil) then
    vim.b.current_syntax = nil
end

local function getSizeTable(table)
    local var = '0'
    for _ in pairs(table) do
        var = var + 1
    end
    return var
end

local function syntaxKeyword(keyword, group, opts, nextgroup)
    if (keyword ~= nil) then
        api.nvim_command('syntax keyword '..group..' '..keyword..
            opts..' nextgroup='..nextgroup..' skipwhite')
    end
end

local function syntaxMatch(match, prefix, group, opts, nextgroup)
    if (match ~= nil) then
        if (prefix ~= nil) then
            if (prefix == '0') then
                prefix = '%(-append\\|-delete\\|-replace\\)'
            elseif (prefix == '1') then
                prefix = '%(-append\\|-delete\\|-replace\\)\\?'
            end
        end

        api.nvim_command('syntax match '..group..' '..'\"\\<'..
            match..'\\'..prefix..'\\>\"'..opts..' nextgroup='..nextgroup..' skipwhite')
    end
end

local function syntax(table)
    local size = getSizeTable(table)

    -- Loop to iterate over all values from the table.
    local i = 0
    while i < size do
        i = i + 1

        local keyword, match, prefix, group, nextgroup, opts

        if (table[i].pre == nil and table[i].suf == nil) then
            keyword   = table[i].id
            group     = table[i].gr
            opts      = table[i].opts
            nextgroup = table[i].ng
        elseif (table[i].pre ~= nil or table[i].suf ~= nil) then
            match     = table[i].id
            prefix    = table[i].pre
            group     = table[i].gr
            opts      = table[i].opts
            nextgroup = table[i].ng
        end

        -- If "opts" or "nextgroup" is empty, assign the empty string to avoid
        -- the error on nil.
        if (opts == nil) then
            opts = ''
        else
            opts = ' '..opts
        end

        if (nextgroup == nil) then
            nextgroup = ''
        end

        -- Syntax highlighting with the `keyword`.
        syntaxKeyword(keyword, group, opts, nextgroup)

        -- Syntax highlighting with the `match`.
        syntaxMatch(match, prefix, group, opts, nextgroup)
    end
end

-- Function for group highlighting
local function highlight(group, link)
    api.nvim_command('hi def link '..group..' '..link)
end

local current_path = vim.fn.expand('<sfile>:p:h:h')
package.path = current_path..'/dict/?.lua;'..package.path

local keywords = require 'macports-keywords'
vim.api.nvim_command 'runtime! viml/syntax/portfile.vim'

--  syntax from the values of the "keywords" table
syntax(keywords)

highlight('mpKeywords',            'Keyword')
highlight('mpPhases',              'Keyword')
highlight('mpNumber',              'Number')
highlight('mpComment',             'Comment')
highlight('mpVariable',            'Identifier')
highlight('mpString',              'String')
highlight('mpStringNotes',         'String')
highlight('mpURL',                 'Underlined')
highlight('mpTcl',                 'Keyword')

highlight('mpBoolKeywords',        'Boolean')
highlight('mpPortGroupName',       'Constant')
highlight('mpChecksumsType',       'Special')
highlight('mpDescription',         'String')
highlight('mpConfEntries',         'String')
highlight('mpCategoriesName',      'Identifier')

highlight('mpVariantRequires',    'Statement')
highlight('mpVariantConflicts',   'Statement')
highlight('mpVariantDescription', 'Statement')
highlight('mpVariantName',        'Identifier')
highlight('mpDefaultVariants',    'Identifier')
highlight('mpPlatformName',       'Identifier')
highlight('mpPlatformVersion',    'Number')
highlight('mpPlatformArch',       'Special')
highlight('mpSubportName',        'Identifier')
highlight('mpDepends',            'Keyword')
highlight('mpDependsEntry',       'Special')
highlight('mpStartupPid',         'Special')

-- Set Portfile as filetype for the current buffer
vim.b.current_syntax = 'Portfile'
