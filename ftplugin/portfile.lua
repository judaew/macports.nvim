local bo = vim.bo

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

if (vim.g.macports_snippets == 1) then
    local current_path = vim.fn.expand('<sfile>:p:h:h')
    vim.b.vsnip_snippet_dir = current_path..'/snippets'
end
