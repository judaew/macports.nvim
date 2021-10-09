local api = vim.api

api.nvim_command('setlocal iskeyword+=-,.')

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

local keywords = {
    -- Global keywords
    { id='PortSystem',                          gr='mpKeywords' },
    { id='PortGroup',                           gr='mpKeywords' },
    { id='name',                                gr='mpKeywords' },
    { id='version',                             gr='mpKeywords' },
    { id='revision',                            gr='mpKeywords' },
    { id='epoch',                               gr='mpKeywords' },
    { id='conflicts',                  pre='1', gr='mpKeywords' },
    { id='replaced_by',                         gr='mpKeywords' },
    { id='categories',                 pre='1', gr='mpKeywords' },
    { id='supported_archs',            pre='1', gr='mpKeywords', ng="mpSupportedArchs" },
    { id='license',                    pre='1', gr='mpKeywords' },
    { id='license_noconflict',         pre='1', gr='mpKeywords' },
    { id='maintainers',                         gr='mpKeywords' },
    { id='description',                pre='1', gr='mpKeywords', ng='mpDescription' },
    { id='long_description',           pre='1', gr='mpKeywords', ng='mpDescription' },
    { id='homepage',                            gr='mpKeywords' },
    { id='master_sites',               pre='1', gr='mpKeywords' },
    { id='master_sites.mirror_subdir',          gr='mpKeywords' },
    { id='patch_sites',                pre='1', gr='mpKeywords' },
    { id='distfiles',                  pre='1', gr='mpKeywords' },
    { id='distname',                            gr='mpKeywords' },
    { id='dist_subdir',                         gr='mpKeywords' },
    { id='checksums',                  pre='1', gr='mpKeywords', ng='mpChecksums' },
    { id='worksrcdir',                          gr='mpKeywords' },
    { id='depends_skip_archcheck',     pre='1', gr='mpKeywords' },
    { id='install.asroot',                      gr='mpKeywords', ng='mpBool' },
    { id='universal_variant',                   gr='mpKeywords', ng='mpBool' },

    -- Checksums type keywords

    { id='md5',                                 gr='mpChecksumsType', opts='contained' },
    { id='sha1',                                gr='mpChecksumsType', opts='contained' },
    { id='rmd160',                              gr='mpChecksumsType', opts='contained' },
    { id='sha256',                              gr='mpChecksumsType', opts='contained' },
    { id='size',                                gr='mpChecksumsType', opts='contained' },

    -- Port phases keywords

    { id='fetch',                               gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-fetch',                           gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-fetch',                          gr='mpPhases', ng='mpPhaseBlock' },
    { id='extract',                             gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-extract',                         gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-extract',                        gr='mpPhases', ng='mpPhaseBlock' },
    { id='patch',                               gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-patch',                           gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-patch',                          gr='mpPhases', ng='mpPhaseBlock' },
    { id='configure',                           gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-configure',                       gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-configure',                      gr='mpPhases', ng='mpPhaseBlock' },
    { id='build',                               gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-build',                           gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-build',                          gr='mpPhases', ng='mpPhaseBlock' },
    { id='test',                                gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-test',                            gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-test',                           gr='mpPhases', ng='mpPhaseBlock' },
    { id='destroot',                            gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-destroot',                        gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-destroot',                       gr='mpPhases', ng='mpPhaseBlock' },
    { id='archive',                             gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-archive',                         gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-archive',                        gr='mpPhases', ng='mpPhaseBlock' },
    { id='install',                             gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-install',                         gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-install',                        gr='mpPhases', ng='mpPhaseBlock' },
    { id='activate',                            gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-activate',                        gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-activate',                       gr='mpPhases', ng='mpPhaseBlock' },
    { id='deactivate',                          gr='mpPhases', ng='mpPhaseBlock' },
    { id='pre-deactivate',                      gr='mpPhases', ng='mpPhaseBlock' },
    { id='post-deactivate',                     gr='mpPhases', ng='mpPhaseBlock' },
    { id='notes',                               gr='mpPhases', ng='mpPhaseBlock' },

    -- Fetch phase keywords

    { id='fetch.type',                          gr='mpKeywords' },
    { id='fetch.user',                          gr='mpKeywords' },
    { id='fetch.password',                      gr='mpKeywords' },
    { id='fetch.use_epsv',                      gr='mpKeywords', ng='mpBool' },
    { id='fetch.ignore_sslcert',                gr='mpKeywords', ng='mpBool' },
    { id='cvs.root',                            gr='mpKeywords' },
    { id='cvs.password',                        gr='mpKeywords' },
    { id='cvs.tag',                             gr='mpKeywords' },
    { id='cvs.date',                            gr='mpKeywords' },
    { id='cvs.module',                          gr='mpKeywords' },
    { id='svn.url',                             gr='mpKeywords' },
    { id='svn.revision',                        gr='mpKeywords' },
    { id='svn.method',                          gr='mpKeywords' },
    { id='bzr.url',                             gr='mpKeywords' },
    { id='bzr.revision',                        gr='mpKeywords' },
    { id='git.url',                             gr='mpKeywords' },
    { id='git.branch',                          gr='mpKeywords' },
    { id='hg.url',                              gr='mpKeywords' },
    { id='hg.tag',                              gr='mpKeywords' },

    -- Extract phase keywords

    { id='extract.asroot',                      gr='mpKeywords', ng='mpBool' },
    { id='extract.suffix',                      gr='mpKeywords' },
    { id='extract.mkdir',                       gr='mpKeywords', ng='mpBool' },
    { id='extract.cmd',                         gr='mpKeywords' },
    { id='extract.only',               pre='1', gr='mpKeywords' },
    { id='extract.args',               pre='1', gr='mpKeywords' },
    { id='extract.pre_args',           pre='1', gr='mpKeywords' },
    { id='extract.post_args',          pre='1', gr='mpKeywords' },
    { id='use_mkdir',                           gr='mpKeywords', ng='mpBool' },
    { id='use_7z',                              gr='mpKeywords', ng='mpBool' },
    { id='use_bzip2',                           gr='mpKeywords', ng='mpBool' },
    { id='use_lzip',                            gr='mpKeywords', ng='mpBool' },
    { id='use_lzma',                            gr='mpKeywords', ng='mpBool' },
    { id='use_tar',                             gr='mpKeywords', ng='mpBool' },
    { id='use_zip',                             gr='mpKeywords', ng='mpBool' },
    { id='use_xz',                              gr='mpKeywords', ng='mpBool' },
    { id='use_dmg',                             gr='mpKeywords', ng='mpBool' },

    -- Patch phase keywords

    { id='patch.dir',                           gr='mpKeywords' },
    { id='patch.args',                          gr='mpKeywords' },
    { id='patch.pre_args',                      gr='mpKeywords' },
    { id='patch.post_args',                     gr='mpKeywords' },
    { id='patchfiles',                 pre='1', gr='mpKeywords' },

    -- Configure phase keywords

    { id='use_configure',                       gr='mpKeywords', ng='mpBool' },
    { id='configure.cmd',              pre='1', gr='mpKeywords' },
    { id='configure.env',              pre='1', gr='mpKeywords' },
    { id='configure.cflags',           pre='1', gr='mpKeywords' },
    { id='configure.ldflags',          pre='1', gr='mpKeywords' },
    { id='configure.cppflags',         pre='1', gr='mpKeywords' },
    { id='configure.cxxflags',         pre='1', gr='mpKeywords' },
    { id='configure.objcflags',        pre='1', gr='mpKeywords' },
    { id='configure.fflags',           pre='1', gr='mpKeywords' },
    { id='configure.fcflags',          pre='1', gr='mpKeywords' },
    { id='configure.f90flags',         pre='1', gr='mpKeywords' },
    { id='configure.args',             pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.pre_args',         pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.post_args',        pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.asroot',                    gr='mpKeywords', ng='mpBool' },
    { id='configure.optflags',         pre='1', gr='mpKeywords' },
    { id='configure.classpath',        pre='1', gr='mpKeywords' },
    { id='configure.macosx_deployment_target', pre='1', gr='mpKeywords' },
    { id='configure.cc',               pre='1', gr='mpKeywords' },
    { id='configure.cpp',              pre='1', gr='mpKeywords' },
    { id='configure.cxx',              pre='1', gr='mpKeywords' },
    { id='configure.objc',             pre='1', gr='mpKeywords' },
    { id='configure.fc',               pre='1', gr='mpKeywords' },
    { id='configure.f77',              pre='1', gr='mpKeywords' },
    { id='configure.f90',              pre='1', gr='mpKeywords' },
    { id='configure.javac',            pre='1', gr='mpKeywords' },
    { id='configure.compiler',         pre='1', gr='mpKeywords' },
    { id='configure.perl',                      gr='mpKeywords' },
    { id='configure.python',                    gr='mpKeywords' },
    { id='configure.ruby',                      gr='mpKeywords' },
    { id='configure.install',                   gr='mpKeywords' },
    { id='configure.awk',                       gr='mpKeywords' },
    { id='configure.bison',                     gr='mpKeywords' },
    { id='configure.pkg_config',       pre='1', gr='mpKeywords' },
    { id='configure.pkg_config_path',  pre='1', gr='mpKeywords' },
    { id='configure.universal_args',   pre='1', gr='mpKeywords' },
    { id='configure.universal_cflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_cppflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_cxxflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_ldflags',  pre='1', gr='mpKeywords' },
    { id='compiler.blacklist',         pre='1', gr='mpKeywords' },
    { id='compiler.whitelist',                  gr='mpKeywords' },
    { id='compiler.fallback',          pre='1', gr='mpKeywords' },
    { id='compiler.c_standard',                 gr='mpKeywords' },
    { id='compiler.cxx_standard',               gr='mpKeywords' },

    -- Automake, autoconf annd autoreconf keywords

    { id='use_automake',                        gr='mpKeywords', ng='mpBool' },
    { id='use_autoconf',                        gr='mpKeywords', ng='mpBool' },
    { id='use_autoreconf',                      gr='mpKeywords', ng='mpBool' },
    { id='automake.args',                       gr='mpKeywords' },
    { id='autoconf.env',                        gr='mpKeywords' },
    { id='autoconf.args',                       gr='mpKeywords' },
    { id='autoconf.pre_args',                   gr='mpKeywords' },
    { id='autoconf.post_args',                  gr='mpKeywords' },
    { id='autoreconf.env',                      gr='mpKeywords' },
    { id='autoreconf.args',                     gr='mpKeywords' },
    { id='autoreconf.pre_args',                 gr='mpKeywords' },
    { id='autoreconf.post_args',                gr='mpKeywords' },
    -- Build phase keywords

    { id='build.cmd',                           gr='mpKeywords' },
    { id='build.type',                          gr='mpKeywords' },
    { id='build.dir',                           gr='mpKeywords' },
    { id='build.asroot',                        gr='mpKeywords', ng='mpBool' },
    { id='build.jobs',                          gr='mpKeywords' },
    { id='build.args',                 pre='1', gr='mpKeywords' },
    { id='build.pre_args',             pre='1', gr='mpKeywords' },
    { id='build.post_args',            pre='1', gr='mpKeywords' },
    { id='build.target',               pre='1', gr='mpKeywords' },
    { id='build.env',                  pre='1', gr='mpKeywords' },
    { id='use_parallel_build',                  gr='mpKeywords', ng='mpBool' },

    -- Test phase keywords

    { id='test.run',                            gr='mpKeywords', ng='mpBool' },
    { id='test.cmd',                            gr='mpKeywords'},
    { id='test.args',                  pre='1', gr='mpKeywords'},
    { id='test.pre_args',              pre='1', gr='mpKeywords'},
    { id='test.post_args',             pre='1', gr='mpKeywords'},
    { id='test.target',                pre='1', gr='mpKeywords'},
    { id='test.env',                   pre='1', gr='mpKeywords'},
    { id='test.asroot',                         gr='mpKeywords', ng='mpBool' },

    -- Destroot phase keywords

    { id='destroot.cmd',                        gr='mpKeywords' },
    { id='destroot.type',                       gr='mpKeywords' },
    { id='destroot.dir',                        gr='mpKeywords' },
    { id='destroot.destdir',                    gr='mpKeywords' },
    { id='destroot.umask',                      gr='mpKeywords' },
    { id='destroot.keepdirs',                   gr='mpKeywords' },
    { id='destroot.asroot',                     gr='mpKeywords', ng='mpBool' },
    { id='destroot.violate_mtree',              gr='mpKeywords', ng='mpBool' },
    { id='destroot.args',              pre='1', gr='mpKeywords' },
    { id='destroot.pre_args',          pre='1', gr='mpKeywords' },
    { id='destroot.post_args',         pre='1', gr='mpKeywords' },
    { id='destroot.target',            pre='1', gr='mpKeywords' },
    { id='destroot.env',               pre='1', gr='mpKeywords' },

    -- Variant keywords
    { id='requires',                            gr='mpVariantRequires',  ng='mpVariantName', opts='contained' },
    { id='conflicts',                           gr='mpVariantConflicts', ng='mpVariantName', opts='contained' },
    { id='description',                         gr='mpVariantDescription',                   opts='contained' },
    { id='universal_variant',                   gr='mpKeywords',         ng='mpBool' },
    { id='default_variants', pre='1',           gr='mpKeywords',         ng='mpDefaultVariants' },

    -- Platform nname and arch keywords
    { id='darwin',                              gr='mpPlatformName', opts='contained' },
    { id='macosx',                              gr='mpPlatformName', opts='contained' },
    { id='puredarwin',                          gr='mpPlatformName', opts='contained' },
    { id='freebsd',                             gr='mpPlatformName', opts='contained' },
    { id='linux',                               gr='mpPlatformName', opts='contained' },
    { id='netbsd',                              gr='mpPlatformName', opts='contained' },
    { id='openbsd',                             gr='mpPlatformName', opts='contained' },
    { id='solaris',                             gr='mpPlatformName', opts='contained' },
    { id='sunos',                               gr='mpPlatformName', opts='contained' },

    { id='arm64',                               gr='mpPlatformArch', opts='contained' },
    { id='i386',                                gr='mpPlatformArch', opts='contained' },
    { id='ppc',                                 gr='mpPlatformArch', opts='contained' },
    { id='pcc64',                               gr='mpPlatformArch', opts='contained' },
    { id='x86_64',                              gr='mpPlatformArch', opts='contained' },
    { id='noarch',                              gr='mpPlatformArch', opts='contained' },

    -- Dependencies keywords

    { id='depends_fetch',              pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_extract',            pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_build',              pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_lib',                pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_run',                pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_test',               pre='1', gr='mpKeywords', ng='mpDependsEntries' },

    -- Startupitems keywords

    { id='startupitem.start',                   gr='mpKeywords' },
    { id='startupitem.stop',                    gr='mpKeywords' },
    { id='startupitem.restart',                 gr='mpKeywords' },
    { id='startupitem.init',                    gr='mpKeywords' },
    { id='startupitem.executable',              gr='mpKeywords' },
    { id='startupitem.logfile',                 gr='mpKeywords' },
    { id='startupitem.location',                gr='mpKeywords' },
    { id='startupitem.type',                    gr='mpKeywords' },
    { id='startupitem.name',                    gr='mpKeywords' },
    { id='startupitem.install',                 gr='mpKeywords', ng='mpBool' },
    { id='startupitem.autostart',               gr='mpKeywords', ng='mpBool' },
    { id='startupitem.create',                  gr='mpKeywords', ng='mpBool' },
    { id='startupitem.debug',                   gr='mpKeywords', ng='mpBool' },
    { id='startupitem.logevents',               gr='mpKeywords', ng='mpBool' },
    { id='startupitem.netchange',               gr='mpKeywords', ng='mpBool' },

    { id='startupitem.pidfile',                 gr='mpKeywords', ng='mpStartupPid' },
    { id='none',                                gr='mpStartupPid', opts='contained' },
    { id='auto',                                gr='mpStartupPid', opts='contained' },
    { id='clean',                               gr='mpStartupPid', opts='contained' },
    { id='manual',                              gr='mpStartupPid', opts='contained' },

    { id='livecheck.type',                      gr='mpKeywords' },
    { id='livecheck.name',                      gr='mpKeywords' },
    { id='livecheck.distname',                  gr='mpKeywords' },
    { id='livecheck.version',                   gr='mpKeywords' },
    { id='livecheck.url',                       gr='mpKeywords' },
    { id='livecheck.regex',                     gr='mpKeywords' },
    { id='livecheck.md5',                       gr='mpKeywords' },
    { id='distcheck.check',                     gr='mpKeywords' },

    { id='set',                                 gr='mpKeywords' },
    { id='set',                                 gr='mpTcl', opts='contained' },
    { id='xinstall',                            gr='mpTcl', opts='contained' },
    { id='fs-traverse',                         gr='mpTcl', opts='contained' },
    { id='readdir',                             gr='mpTcl', opts='contained' },
    { id='vercmp',                              gr='mpTcl', opts='contained' },
    { id='reinplace',                           gr='mpTcl', opts='contained' },
    { id='strsed',                              gr='mpTcl', opts='contained' },
    { id='copy',                                gr='mpTcl', opts='contained' },
    { id='move',                                gr='mpTcl', opts='contained' },
    { id='delete',                              gr='mpTcl', opts='contained' },
    { id='touch',                               gr='mpTcl', opts='contained' },
    { id='ln',                                  gr='mpTcl', opts='contained' },
    { id='system',                              gr='mpTcl', opts='contained' }
}

vim.api.nvim_command 'runtime! viml/syntax/portfile.vim'

--  syntax from the values of the "keywords" table
syntax(keywords)

highlight('mpKeywords',            'Keyword')
highlight('mpPhases',              'Keyword')
highlight('mpTcl',                 'Keyword')
highlight('mpComment',             'Comment')
highlight('mpVariable',            'Identifier')
highlight('mpString',              'String')

highlight('mpBoolKeywords',        'Special')
highlight('mpChecksumsType',       'Special')
highlight('mpDescription',         'String')
highlight('mpConfEntries',         'String')

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
