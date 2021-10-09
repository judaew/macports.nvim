local bo = vim.bo

if (vim.b.did_ftplugin ~= nil) then
    vim.b.did_ftplugin = nil
end
vim.b.did_ftplugin = 1

bo.modeline      = false
bo.fileencoding  = 'utf-8'
bo.expandtab     = true
bo.shiftwidth    = 4
bo.tabstop       = 4
bo.softtabstop   = 4
bo.commentstring = '# %s'
