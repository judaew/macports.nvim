local bo = vim.bo
local current_path = vim.fn.expand('<sfile>:p:h:h')

if (vim.b.did_ftplugin ~= nil) then
    vim.b.did_ftplugin = nil
end
vim.b.did_ftplugin = 1

vim.api.nvim_command('setlocal iskeyword+=-,.')

bo.modeline      = false
bo.fileencoding  = 'utf-8'
bo.expandtab     = true
bo.shiftwidth    = 4
bo.tabstop       = 4
bo.softtabstop   = 4
bo.commentstring = '# %s'

-- Snippets
if (vim.g.macports_snippets == 1) then
    vim.b.vsnip_snippet_dir = current_path..'/snippets'
end

-- Completion on the completefunc
if (vim.g.macports_completefunc == 1) then
    package.path = current_path..'/dict/?.lua;'..package.path
    local keywords = require 'macports-keywords'

    local size = 0
    for _ in pairs(keywords) do
        size = size + 1
    end

    local keywords_compl = ''

    local i = 0
    while i < size do
        i = i + 1

        local keyword, group
        keyword   = keywords[i].id
        group     = keywords[i].gr

        if (group == 'mpKeywords') then
            keywords_compl = keywords_compl .. ' ' .. keyword
        end
    end

    vim.g.macports_completefunc_keywords = keywords_compl
    vim.opt_local.completefunc = 'portfilecomplete#CompleteFA'
end
