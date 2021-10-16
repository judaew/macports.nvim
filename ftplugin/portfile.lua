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

vim.g.macports_completefunc = 1

-- Completion on the completefunc
if (vim.g.macports_completefunc == 1) then
    vim.g.macports_completefunc_keywords = current_path
        ..'/dict/macports-keywords.txt'
    vim.opt_local.completefunc = 'portfilecomplete#CompleteFA'
end
