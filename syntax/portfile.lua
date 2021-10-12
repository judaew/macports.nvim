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

local keywords = {
    -- +-----------------+
    -- | GLOBAL KEYWORDS |
    -- +-----------------+

    { id='PortSystem',                          gr='mpKeywords' },
    { id='PortGroup',                           gr='mpKeywords', ng='mpPortGroup' },
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
    { id='homepage',                            gr='mpKeywords', ng='mpURL' },
    { id='master_sites',               pre='1', gr='mpKeywords', ng='mpURL' },
    { id='master_sites.mirror_subdir',          gr='mpKeywords' },
    { id='patch_sites',                pre='1', gr='mpKeywords', ng='mpURL' },
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
    { id='notes',                               gr='mpPhases', ng='mpStringNotes' },

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
    { id='svn.url',                             gr='mpKeywords', ng='mpURL' },
    { id='svn.revision',                        gr='mpKeywords' },
    { id='svn.method',                          gr='mpKeywords' },
    { id='bzr.url',                             gr='mpKeywords', ng='mpURL' },
    { id='bzr.revision',                        gr='mpKeywords' },
    { id='git.url',                             gr='mpKeywords', ng='mpURL' },
    { id='git.branch',                          gr='mpKeywords' },
    { id='hg.url',                              gr='mpKeywords', ng='mpURL' },
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

    -- Platform name and arch keywords

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
    { id='ppc64',                               gr='mpPlatformArch', opts='contained' },
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
    { id='livecheck.url',                       gr='mpKeywords', ng='mpURL' },
    { id='livecheck.regex',                     gr='mpKeywords' },
    { id='livecheck.md5',                       gr='mpKeywords' },
    { id='distcheck.check',                     gr='mpKeywords' },

    -- Tcl and Tcl extensions keywords

    { id='set',                                 gr='mpKeywords' },
    { id='set',                                 gr='mpTcl', opts='contained' },
    { id='xinstall',                            gr='mpTcl', opts='contained' },
    { id='fs-traverse',                         gr='mpTcl', opts='contained' },
    { id='readdir',                             gr='mpTcl', opts='contained' },
    { id='vercmp',                              gr='mpTcl', opts='contained' },
    { id='reinplace',                           gr='mpTcl', opts='contained' },
    { id='strsed',                              gr='mpTcl', opts='contained' },
    { id='file',                                gr='mpTcl', opts='contained' },
    { id='copy',                                gr='mpTcl', opts='contained' },
    { id='move',                                gr='mpTcl', opts='contained' },
    { id='delete',                              gr='mpTcl', opts='contained' },
    { id='touch',                               gr='mpTcl', opts='contained' },
    { id='ln',                                  gr='mpTcl', opts='contained' },
    { id='system',                              gr='mpTcl', opts='contained' },
    { id='foreach',                             gr='mpTcl', opts='contained' },
    { id='if',                                  gr='mpTcl', opts='contained' },
    { id='variant_isset',                       gr='mpTcl', opts='contained' },
    { id='variant_set',                         gr='mpTcl', opts='contained' },
    { id='ui_debug',                            gr='mpTcl', opts='contained' },
    { id='ui_error',                            gr='mpTcl', opts='contained' },
    { id='ui_info',                             gr='mpTcl', opts='contained' },
    { id='ui_msg',                              gr='mpTcl', opts='contained' },
    { id='ui_warn',                             gr='mpTcl', opts='contained' },

    -- +-------------+
    -- | PORT GROUPS |
    -- +-------------+

    -- PortGroup names

    { id='active_variants',                     gr='mpPortGroupName', opts='contained' },
    { id='apache2',                             gr='mpPortGroupName', opts='contained' },
    { id='app',                                 gr='mpPortGroupName', opts='contained' },
    { id='archcheck',                           gr='mpPortGroupName', opts='contained' },
    { id='bazel',                               gr='mpPortGroupName', opts='contained' },
    { id='bitbucket',                           gr='mpPortGroupName', opts='contained' },
    { id='boost',                               gr='mpPortGroupName', opts='contained' },
    { id='cargo',                               gr='mpPortGroupName', opts='contained' },
    { id='cargo_fetch',                         gr='mpPortGroupName', opts='contained' },
    { id='clang_dependency',                    gr='mpPortGroupName', opts='contained' },
    { id='cltversion',                          gr='mpPortGroupName', opts='contained' },
    { id='cmake',                               gr='mpPortGroupName', opts='contained' },
    { id='compiler_blacklist_versions',         gr='mpPortGroupName', opts='contained' },
    { id='compiler_wrapper',                    gr='mpPortGroupName', opts='contained' },
    { id='compilers',                           gr='mpPortGroupName', opts='contained' },
    { id='conflicts_build',                     gr='mpPortGroupName', opts='contained' },
    { id='crossbinutils',                       gr='mpPortGroupName', opts='contained' },
    { id='crossgcc',                            gr='mpPortGroupName', opts='contained' },
    { id='cxx11',                               gr='mpPortGroupName', opts='contained' },
    { id='debug',                               gr='mpPortGroupName', opts='contained' },
    { id='deprecated',                          gr='mpPortGroupName', opts='contained' },
    { id='developerversion',                    gr='mpPortGroupName', opts='contained' },
    { id='elisp',                               gr='mpPortGroupName', opts='contained' },
    { id='fuse',                                gr='mpPortGroupName', opts='contained' },
    { id='gitea',                               gr='mpPortGroupName', opts='contained' },
    { id='github',                              gr='mpPortGroupName', opts='contained' },
    { id='gitlab',                              gr='mpPortGroupName', opts='contained' },
    { id='gnu_info',                            gr='mpPortGroupName', opts='contained' },
    { id='gnustep',                             gr='mpPortGroupName', opts='contained' },
    { id='gobject_introspection',               gr='mpPortGroupName', opts='contained' },
    { id='golang',                              gr='mpPortGroupName', opts='contained' },
    { id='gpg_verify',                          gr='mpPortGroupName', opts='contained' },
    { id='haskell_cabal',                       gr='mpPortGroupName', opts='contained' },
    { id='haskell_stack',                       gr='mpPortGroupName', opts='contained' },
    { id='hunspelldict',                        gr='mpPortGroupName', opts='contained' },
    { id='janet',                               gr='mpPortGroupName', opts='contained' },
    { id='java',                                gr='mpPortGroupName', opts='contained' },
    { id='kde4',                                gr='mpPortGroupName', opts='contained' },
    { id='legacysupport',                       gr='mpPortGroupName', opts='contained' },
    { id='linear_algebra',                      gr='mpPortGroupName', opts='contained' },
    { id='luarocks',                            gr='mpPortGroupName', opts='contained' },
    { id='makefile',                            gr='mpPortGroupName', opts='contained' },
    { id='meson',                               gr='mpPortGroupName', opts='contained' },
    { id='mpi',                                 gr='mpPortGroupName', opts='contained' },
    { id='mpiutil',                             gr='mpPortGroupName', opts='contained' },
    { id='muniversal',                          gr='mpPortGroupName', opts='contained' },
    { id='obsolete',                            gr='mpPortGroupName', opts='contained' },
    { id='ocaml',                               gr='mpPortGroupName', opts='contained' },
    { id='octave',                              gr='mpPortGroupName', opts='contained' },
    { id='old_openssl',                         gr='mpPortGroupName', opts='contained' },
    { id='perl5',                               gr='mpPortGroupName', opts='contained' },
    { id='php',                                 gr='mpPortGroupName', opts='contained' },
    { id='pure',                                gr='mpPortGroupName', opts='contained' },
    { id='python',                              gr='mpPortGroupName', opts='contained' },
    { id='qmake',                               gr='mpPortGroupName', opts='contained' },
    { id='qmake5',                              gr='mpPortGroupName', opts='contained' },
    { id='qt4',                                 gr='mpPortGroupName', opts='contained' },
    { id='qt5',                                 gr='mpPortGroupName', opts='contained' },
    { id='ruby',                                gr='mpPortGroupName', opts='contained' },
    { id='select',                              gr='mpPortGroupName', opts='contained' },
    { id='sourcehut',                           gr='mpPortGroupName', opts='contained' },
    { id='texlive',                             gr='mpPortGroupName', opts='contained' },
    { id='waf',                                 gr='mpPortGroupName', opts='contained' },
    { id='wxWidgets',                           gr='mpPortGroupName', opts='contained' },
    { id='x11font',                             gr='mpPortGroupName', opts='contained' },
    { id='xcode',                               gr='mpPortGroupName', opts='contained' },
    { id='xcode_workaround',                    gr='mpPortGroupName', opts='contained' },
    { id='xcodeversion',                        gr='mpPortGroupName', opts='contained' },
    { id='xmlcatalog',                          gr='mpPortGroupName', opts='contained' },

    -- active_variants (1.1) keywords

    { id='active_variants',                     gr='mpKeywords' },

    -- app keywords

    { id='app.create',                          gr='mpKeywords', ng='mpBool' },
    { id='app.name',                            gr='mpKeywords' },
    { id='app.executable',                      gr='mpKeywords' },
    { id='app.icon',                            gr='mpKeywords' },
    { id='app.short_version_string',            gr='mpKeywords' },
    { id='app.version',                         gr='mpKeywords' },
    { id='app.identifier',                      gr='mpKeywords' },
    { id='app.retina',                          gr='mpKeywords', ng='mpBool' },
    { id='app.dark_mode',                       gr='mpKeywords', ng='mpBool' },
    { id='app.privacy_microphone',              gr='mpKeywords', ng='mpBool' },
    { id='app.privacy_camera',                  gr='mpKeywords', ng='mpBool' },
    { id='app.privacy_contacts',                gr='mpKeywords', ng='mpBool' },
    { id='app.privacy_calendars',               gr='mpKeywords', ng='mpBool' },
    { id='app.privacy_photo',                   gr='mpKeywords', ng='mpBool' },
    { id='app.hide_dock_icon',                  gr='mpKeywords', ng='mpBool' },
    { id='app.use_launch_script',               gr='mpKeywords', ng='mpBool' },

    -- bazel keywords

    { id='bazel.version',                       gr='mpKeywords' },
    { id='bazel.min_xcode',                     gr='mpKeywords' },
    { id='bazel.run_bazel_fetch',               gr='mpKeywords', ng='mpBool' },
    { id='bazel.max_idle_secs',                 gr='mpKeywords' },
    { id='bazel.max_cpu_fraction',              gr='mpKeywords' },
    { id='bazel.max_ram_fraction',              gr='mpKeywords' },
    { id='bazel.limit_build_jobs',              gr='mpKeywords', ng='mpBool' },
    { id='bazel.cxx_standard',                  gr='mpKeywords' },
    { id='bazel.python_version',                gr='mpKeywords' },
    { id='bazel.build_cmd',            pre='1', gr='mpKeywords' },
    { id='bazel.build_cmd_opts',       pre='1', gr='mpKeywords' },
    { id='bazel.build_opts',           pre='1', gr='mpKeywords' },
    { id='bazel.build_target',         pre='1', gr='mpKeywords' },
    { id='bazel.post_build_cmd',       pre='1', gr='mpKeywords' },
    { id='bazel.extra_build_cmd_opts', pre='1', gr='mpKeywords' },
    { id='bazel.extra_build_opts',     pre='1', gr='mpKeywords' },
    { id='bazel.configure_cmd',        pre='1', gr='mpKeywords' },
    { id='bazel.configure_args',       pre='1', gr='mpKeywords' },
    { id='bazel.configure_pre_args',   pre='1', gr='mpKeywords' },
    { id='bazel.configure_path',       pre='1', gr='mpKeywords' },

    -- bitbucket keywords

    { id='bitbucket.author',                    gr='mpKeywords' },
    { id='bitbucket.project',                   gr='mpKeywords' },
    { id='bitbucket.version',                   gr='mpKeywords' },
    { id='bitbucket.tag_prefix',                gr='mpKeywords' },
    { id='bitbucket.homepage',                  gr='mpKeywords' },
    { id='bitbucket.master_sites',              gr='mpKeywords' },
    { id='bitbucket.tarball_from',              gr='mpKeywords' },
    { id='bitbucket.livecheck_branch',          gr='mpKeywords' },
    { id='bitbucket.setup',                     gr='mpKeywords' },

    -- boost keywords

    { id='boost.version',                       gr='mpKeywords' },
    { id='boost.depends_type',                  gr='mpKeywords' },
    { id='boost.require_numpy',                 gr='mpKeywords', ng='mpBool' },

    -- cargo keywords

    { id='cargo.bin',                           gr='mpKeywords' },
    { id='cargo.home',                          gr='mpKeywords' },
    { id='cargo.crates',                        gr='mpKeywords' },
    { id='cargo.crates_github',                 gr='mpKeywords' },

    -- clang_dependency keywords

    { id='clang_dependency.extra_versions',     gr='mpKeywords' },

    -- cmake keywords

    { id='cmake.out_of_source',                 gr='mpKeywords', ng='mpBool' },
    { id='cmake.build_dir',                     gr='mpKeywords' },
    { id='cmake.source_dir',                    gr='mpKeywords' },
    { id='cmake.set_osx_architectures',         gr='mpKeywords', ng='mpBool' },
    { id='cmake.build_type',                    gr='mpKeywords' },
    { id='cmake.generator',                     gr='mpKeywords' },
    { id='cmake.generator_blacklist',           gr='mpKeywords' },
    { id='cmake.module_path',          pre='1', gr='mpKeywords' },
    { id='cmake.install_prefix',       pre='1', gr='mpKeywords' },
    { id='cmake.install_rpath',        pre='1', gr='mpKeywords' },

    -- crossbinutils keywords

    { id='crossbinutils.target',                gr='mpKeywords' },
    { id='crossbinutils.setup',                 gr='mpKeywords' },

    -- crossgcc keywords

    { id='crossgcc.target',                     gr='mpKeywords' },
    { id='crossgcc.setup',                      gr='mpKeywords' },
    { id='crossgcc.setup_libc',                 gr='mpKeywords' },

    -- deprecated keywords

    { id='deprecated.maximum_xcodeversion',     gr='mpKeywords' },
    { id='deprecated.maximum_osmajor',          gr='mpKeywords' },
    { id='deprecated.upstream_support',         gr='mpKeywords', ng='mpBool' },
    { id='deprecated.macports_support',         gr='mpKeywords', ng='mpBool' },
    { id='deprecated.eol_version',              gr='mpKeywords', ng='mpBool' },

    -- developerversion keywords

    { id='minimum_developerversions',           gr='mpKeywords' },

    -- github keywords

    { id='github.author',                       gr='mpKeywords' },
    { id='github.project',                      gr='mpKeywords' },
    { id='github.version',                      gr='mpKeywords' },
    { id='github.tag_prefix',                   gr='mpKeywords' },
    { id='github.tag_suffix',                   gr='mpKeywords' },
    { id='github.homepage',                     gr='mpKeywords' },
    { id='github.raw',                          gr='mpKeywords' },
    { id='github.master_sites',                 gr='mpKeywords' },
    { id='github.tarball_from',                 gr='mpKeywords' },
    { id='github.setup',                        gr='mpKeywords' },

    -- gitlab keywords

    { id='gitlab.author',                       gr='mpKeywords' },
    { id='gitlab.project',                      gr='mpKeywords' },
    { id='gitlab.version',                      gr='mpKeywords' },
    { id='gitlab.tag_prefix',                   gr='mpKeywords' },
    { id='gitlab.tag_suffix',                   gr='mpKeywords' },
    { id='gitlab.instance',                     gr='mpKeywords' },
    { id='gitlab.homepage',                     gr='mpKeywords' },
    { id='gitlab.master_sites',                 gr='mpKeywords' },
    { id='gitlab.livecheck.branch',             gr='mpKeywords' },
    { id='gitlab.livecheck.regex',              gr='mpKeywords' },
    { id='gitlab.setup',                        gr='mpKeywords' },

    -- gnu_info keywords

    { id='gnu_info.name',                       gr='mpKeywords' },
    { id='gnu_info.files',                      gr='mpKeywords' },
    { id='gnu_info.dir',                        gr='mpKeywords' },
    { id='gnu_info.dirfile',                    gr='mpKeywords' },
    { id='gnu_info.install_info',               gr='mpKeywords' },

    -- gnustep keywords

    { id='gnustep.post_flags',                  gr='mpKeywords' },
    { id='gnustep.cc',                          gr='mpKeywords' },

    -- golang keywords

    { id='go.package',                          gr='mpKeywords' },
    { id='go.domain',                           gr='mpKeywords' },
    { id='go.author',                           gr='mpKeywords' },
    { id='go.project',                          gr='mpKeywords' },
    { id='go.version',                          gr='mpKeywords' },
    { id='go.tag_prefix',                       gr='mpKeywords' },
    { id='go.tag_suffix',                       gr='mpKeywords' },
    { id='go.setup',                            gr='mpKeywords' },
    { id='go.vendors',                          gr='mpKeywords' },

    -- hunspelldict keywords

    { id='hunspelldict.locale',                 gr='mpKeywords' },
    { id='hunspelldict.setup',                  gr='mpKeywords' },

    -- janet keywords

    { id='janet.link_bin',                      gr='mpKeywords', ng='mpBool' },

    -- java keywords

    { id='java.version',                        gr='mpKeywords' },
    { id='java.home',                           gr='mpKeywords' },
    { id='java.fallback',                       gr='mpKeywords' },

    -- legacysupport (1.0 and 1.1) keywords

    { id='legacysupport.newest_darwin_requires_legacy', gr='mpKeywords' },
    { id='legacysupport.header_search',         gr='mpKeywords' },
    { id='legacysupport.use_static',            gr='mpKeywords', ng='mpBool' },
    { id='legacysupport.redirect_bins',         gr='mpKeywords' },
    { id='legacysupport.use_mp_libcxx',         gr='mpKeywords', ng='mpBool'},

    -- makefile keywords

    { id='makefile.has_destdir',                gr='mpKeywords', ng='mpBool' },
    { id='makefile.prefix_name',                gr='mpKeywords' },
    { id='makefile.override',          pre='1', gr='mpKeywords' },
    { id='muniversal.arch_tools',               gr='mpKeywords' },
    { id='makefile.setup',                      gr='mpKeywords' },

    -- muniversal keywords

    { id='merger_configure_compiler',           gr='mpKeywords' },
    { id='merger_configure_cppflags',           gr='mpKeywords' },
    { id='merger_configure_cflags',             gr='mpKeywords' },
    { id='merger_configure_cxxflags',           gr='mpKeywords' },
    { id='merger_configure_objcflags',          gr='mpKeywords' },
    { id='merger_configure_objcxxflags',        gr='mpKeywords' },
    { id='merger_configure_fflags',             gr='mpKeywords' },
    { id='merger_configure_f90flags',           gr='mpKeywords' },
    { id='merger_configure_fcflags',            gr='mpKeywords' },
    { id='merger_configure_ldflags',            gr='mpKeywords' },
    { id='merger_configure_build_env',          gr='mpKeywords' },
    { id='merger_configure_build_args',         gr='mpKeywords' },
    { id='merger_configure_test_env',           gr='mpKeywords' },
    { id='merger_configure_test_args',          gr='mpKeywords' },
    { id='merger_configure_destroot_env',       gr='mpKeywords' },
    { id='merger_configure_destroot_args',      gr='mpKeywords' },
    { id='merger_host',                         gr='mpKeywords' },
    { id='merger_arch_flag',                    gr='mpKeywords', ng='mpBool' },
    { id='merger_arch_compiler',                gr='mpKeywords' },
    { id='merger_dont_diff',                    gr='mpKeywords' },
    { id='merger_must_run_binaries',            gr='mpKeywords', ng='mpBool' },
    { id='merger_no_3_archs',                   gr='mpKeywords', ng='mpBool' },
    { id='universal_archs_supported',           gr='mpKeywords', ng='mpSupportedArchs' },

    -- ocaml (1.0 and 1.1) keywords

    { id='ocaml.build_type',                    gr='mpKeywords' },
    { id='ocaml.destroot_type',                 gr='mpKeywords' },
    { id='ocaml.bin',                           gr='mpKeywords' },
    { id='ocaml.package_dir',                   gr='mpKeywords' },
    { id='ocaml.stublib_dir',                   gr='mpKeywords' },
    { id='ocaml.use_findlib',                   gr='mpKeywords', ng='mpBool' },
    { id='ocaml.setup',                         gr='mpKeywords' },
    { id='dune.root',                           gr='mpKeywords' },
    { id='dune.packages',                       gr='mpKeywords' },
    { id='dune.profile',                        gr='mpKeywords' },
    { id='dune.build.target',                   gr='mpKeywords' },

    -- octave keywords

    { id='octave.module',                       gr='mpKeywords' },
    { id='octave.setup',                        gr='mpKeywords' },

    -- old_openssl keywords

    { id='openssl.branch',                      gr='mpKeywords' },
    { id='openssl.includedir',                  gr='mpKeywords' },
    { id='openssl.libdir',                      gr='mpKeywords' },
    { id='openssl.configure',                   gr='mpKeywords' },

    -- perl5 keywords

    { id='perl5.setup',                         gr='mpKeywords' },
    { id='perl5.branches',                      gr='mpKeywords' },
    { id='perl5.default_branch',                gr='mpKeywords' },
    { id='perl5.default_variant',               gr='mpKeywords' },
    { id='perl5.variant',                       gr='mpKeywords' },
    { id='perl5.set_default_variant',           gr='mpKeywords' },
    { id='perl5.conflict_variants',             gr='mpKeywords', ng='mpBool' },
    { id='perl5.require_variant',               gr='mpKeywords', ng='mpBool' },
    { id='perl5.version',                       gr='mpKeywords' },
    { id='perl5.major',                         gr='mpKeywords' },
    { id='perl5.arch',                          gr='mpKeywords' },
    { id='perl5.bin',                           gr='mpKeywords' },
    { id='perl5.lib',                           gr='mpKeywords' },
    { id='perl5.bindir',                        gr='mpKeywords' },
    { id='perl5.archlib',                       gr='mpKeywords' },
    { id='perl5.link_binaries',                 gr='mpKeywords', ng='mpBool' },
    { id='perl5.link_binaries_suffix',          gr='mpKeywords' },
    { id='perl5.use_module_build',              gr='mpKeywords' },

    -- php (1.1) keywords

    { id='php.branch',                          gr='mpKeywords'},
    { id='php.branches',                        gr='mpKeywords' },
    { id='php.latest_stable_branch',            gr='mpKeywords' },
    { id='php.default_branch',                  gr='mpKeywords' },
    { id='php.rootname',                        gr='mpKeywords' },
    { id='php.create_subports',                 gr='mpKeywords' },
    { id='php.extension_ini',                   gr='mpKeywords' },
    { id='php.extensions',                      gr='mpKeywords' },
    { id='php.extensions.zend',                 gr='mpKeywords' },
    { id='php.build_dirs',                      gr='mpKeywords' },
    { id='php.pecl',                            gr='mpKeywords', ng='mpBool' },
    { id='php.pecl.name',                       gr='mpKeywords' },
    { id='php.pecl.prerelease',                 gr='mpKeywords' },
    { id='php.pecl.regex',                      gr='mpKeywords' },
    { id='php.config',                          gr='mpKeywords' },
    { id='php.extension_dir',                   gr='mpKeywords' },
    { id='php.ini',                             gr='mpKeywords' },
    { id='php.ini_dir',                         gr='mpKeywords' },
    { id='php.ize',                             gr='mpKeywords' },
    { id='php.suffix',                          gr='mpKeywords' },

    -- pure keywords

    { id='pure.setup',                          gr='mpKeywords' },

    -- python keywords

    { id='python.rootname',                     gr='mpKeywords' },
    { id='python.versions',                     gr='mpKeywords' },
    { id='python.default_version',              gr='mpKeywords' },
    { id='python.consistent_destroot',          gr='mpKeywords', ng='mpBool' },
    { id='python.branch',                       gr='mpKeywords' },
    { id='python.prefix',                       gr='mpKeywords' },
    { id='python.bin',                          gr='mpKeywords' },
    { id='python.lib',                          gr='mpKeywords' },
    { id='python.libdir',                       gr='mpKeywords' },
    { id='python.include',                      gr='mpKeywords' },
    { id='python.pkgd',                         gr='mpKeywords' },
    { id='python.pep517',                       gr='mpKeywords', ng='mpBool' },
    { id='python.add_archflags',                gr='mpKeywords' },
    { id='python.set_compiler',                 gr='mpKeywords' },
    { id='python.set_cxx_stdlib',               gr='mpKeywords' },
    { id='python.set_sdkroot',                  gr='mpKeywords', ng='mpBool' },
    { id='python.link_binaries',                gr='mpKeywords', ng='mpBool' },
    { id='python.link_binaries_suffix',         gr='mpKeywords' },
    { id='python.move_binaries',                gr='mpKeywords', ng='mpBool' },
    { id='python.move_binaries_suffix',         gr='mpKeywords' },

    -- qmake annd qmake5 keywords

    { id='qt4.debug_variant',                   gr='mpKeywords', ng='mpBool' },
    { id='qt5.add_spec',                        gr='mpKeywords', ng='mpBool' },
    { id='qt5.debug_variant',                   gr='mpKeywords', ng='mpBool' },
    { id='qt5.top_level',                       gr='mpKeywords' },
    { id='qt5.cxxflags',                        gr='mpKeywords' },
    { id='qt5.ldflags',                         gr='mpKeywords' },
    { id='qt5.frameworkpaths',                  gr='mpKeywords' },
    { id='qt5.spec_cmd',                        gr='mpKeywords' },

    -- qt5 keywords

    { id='qt5.depends_component',               gr='mpKeywords' },
    { id='qt5.depends_build_component',         gr='mpKeywords' },
    { id='qt5.depends_runtime_component',       gr='mpKeywords' },
    { id='qt5.kde_variant',                     gr='mpKeywords' },
    { id='qt5.min_version',                     gr='mpKeywords' },

    -- ruby keywords

    { id='ruby.branch',                         gr='mpKeywords' },
    { id='ruby.branches',                       gr='mpKeywords' },
    { id='ruby.link_binaries',                  gr='mpKeywords', ng='mpBool' },
    { id='ruby.link_binaries_suffix',           gr='mpKeywords' },
    { id='ruby.version',                        gr='mpKeywords' },
    { id='ruby.rdoc',                           gr='mpKeywords' },
    { id='ruby.gem',                            gr='mpKeywords' },
    { id='ruby.rake',                           gr='mpKeywords' },
    { id='ruby.bindir',                         gr='mpKeywords' },
    { id='ruby.gemdirprog_suffix',              gr='mpKeywords' },
    { id='ruby.module',                         gr='mpKeywords' },
    { id='ruby.project',                        gr='mpKeywords' },
    { id='ruby.bin',                            gr='mpKeywords' },
    { id='ruby.lib',                            gr='mpKeywords' },
    { id='ruby.arch',                           gr='mpKeywords' },
    { id='ruby.archlib',                        gr='mpKeywords' },
    { id='ruby.setup',                          gr='mpKeywords' },

    -- select keywords

    { id='select.group',                        gr='mpKeywords' },
    { id='select.file',                         gr='mpKeywords' },
    { id='select.entries',                      gr='mpKeywords' },

    -- sourcehut keywords

    { id='sourcehut.author',                    gr='mpKeywords' },
    { id='sourcehut.project',                   gr='mpKeywords' },
    { id='sourcehut.version',                   gr='mpKeywords' },
    { id='sourcehut.tag_prefix',                gr='mpKeywords' },
    { id='sourcehut.tag_suffix',                gr='mpKeywords' },
    { id='sourcehut.instance',                  gr='mpKeywords' },
    { id='sourcehut.homepage',                  gr='mpKeywords' },
    { id='sourcehut.master_sites',              gr='mpKeywords' },
    { id='sourcehut.livecheck.branch',          gr='mpKeywords' },
    { id='sourcehut.livecheck.regex',           gr='mpKeywords' },
    { id='sourcehut.setup',                     gr='mpKeywords' },

    -- texlive keywords

    { id='texlive.mktexlsr',                    gr='mpKeywords' },
    { id='texlive.removedocdepends',            gr='mpKeywords' },
    { id='texlive.exclude',                     gr='mpKeywords' },
    { id='texlive.binaries',                    gr='mpKeywords' },
    { id='texlive.formats',                     gr='mpKeywords' },
    { id='texlive.languages',                   gr='mpKeywords' },
    { id='texlive.maps',                        gr='mpKeywords' },
    { id='texlive.forceupdatecnf',              gr='mpKeywords' },
    { id='texlive.use_mktexlsr',                gr='mpKeywords', ng='mpBool' },
    { id='texlive.use_mktexlsr_on_deactivate',  gr='mpKeywords', ng='mpBool' },
    { id='texlive.texmfport',                   gr='mpKeywords' },

    -- waf keywords

    { id='waf.python',                          gr='mpKeywords' },
    { id='waf.python_branch',                   gr='mpKeywords' },
    { id='waf.python_version',                  gr='mpKeywords' },

    -- wxWidgets keywords

    { id='wxWidgets.name',                      gr='mpKeywords' },
    { id='wxWidgets.port',                      gr='mpKeywords' },
    { id='wxWidgets.version',                   gr='mpKeywords' },
    { id='wxWidgets.prefix',                    gr='mpKeywords' },
    { id='wxWidgets.wxdir',                     gr='mpKeywords' },
    { id='wxWidgets.wxconfig',                  gr='mpKeywords' },
    { id='wxWidgets.wxrc',                      gr='mpKeywords' },
    { id='wxWidgets.sdk',                       gr='mpKeywords' },
    { id='wxWidgets.macosx_version_min',        gr='mpKeywords' },
    { id='wxWidgets.use',                       gr='mpKeywords' },

    -- x11font keywords

    { id='x11font.setup',                       gr='mpKeywords' },

    -- xcode keywords

    { id='xcode.project',                       gr='mpKeywords' },
    { id='xcode.configuration',                 gr='mpKeywords' },
    { id='xcode.target',                        gr='mpKeywords' },
    { id='xcode.scheme',                        gr='mpKeywords' },
    { id='xcode.build.settings',                gr='mpKeywords' },
    { id='xcode.destroot.type',                 gr='mpKeywords' },
    { id='xcode.destroot.path',                 gr='mpKeywords' },
    { id='xcode.destroot.settings',             gr='mpKeywords' },
    { id='use_xcode',                           gr='mpKeywords', ng='mpBool' },

    -- xcode_workaround keywords

    { id='xcode_workaround.type',               gr='mpKeywords' },
    { id='xcode_workaround.fixed_xcode_version',gr='mpKeywords' },
    { id='xcode_workaround.os_versions',        gr='mpKeywords' },

    -- xcodeversion keywords

    { id='minimum_xcodeversions',               gr='mpKeywords' },

    -- xmlcatalog

    { id='xml.catalog',                         gr='mpKeywords' },
    { id='xml.addtocatalog',                    gr='mpKeywords' },
    { id='xml.entity',                          gr='mpKeywords' },
    { id='xml.rewrite',                         gr='mpKeywords' },
    { id='sgml.catalog',                        gr='mpKeywords' },
    { id='sgml.addtocatalog',                   gr='mpKeywords' }
}

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
