return {
    { id='PortSystem',                          gr='mpKeywords' },
    { id='PortGroup',                           gr='mpKeywords', ng='mpPortGroup' },

    -- Port phases keywords
    -- ####################

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
    { id='notes-append',                        gr='mpPhases', ng='mpStringNotes' },

    -- portmain.tcl
    -- ############

    { id='name',                                gr='mpKeywords' },
    { id='version',                             gr='mpKeywords' },
    { id='revision',                            gr='mpKeywords' },
    { id='epoch',                               gr='mpKeywords' },
    { id='categories',                 pre='1', gr='mpKeywords', ng='mpCategories' },
    { id='maintainers',                         gr='mpKeywords' },
    { id='long_description',           pre='1', gr='mpKeywords', ng='mpDescription' },
    { id='description',                pre='1', gr='mpKeywords', ng='mpDescription' },
    { id='homepage',                            gr='mpKeywords', ng='mpURL' },
    { id='license',                    pre='1', gr='mpKeywords' },
    { id='conflicts',                  pre='1', gr='mpKeywords' },
    { id='replaced_by',                         gr='mpKeywords' },
    { id='known_fail',                          gr='mpKeywords', ng='mpBool' },
    { id='worksrcdir',                          gr='mpKeywords' },
    { id='filesdir',                            gr='mpKeywords' },
    { id='distname',                            gr='mpKeywords' },
    { id='libpath',                             gr='mpKeywords' },
    { id='distpath',                            gr='mpKeywords' },
    -- 'platforms'
    { id='default_variants',           pre='1', gr='mpKeywords', ng='mpDefaultVariants' },
    { id='macosx_deployment_target',            gr='mpKeywords' },
    { id='universal_variant',                   gr='mpKeywords' },
    { id='universal_possible',                  gr='mpKeywords' },
    { id='supported_archs',            pre='1', gr='mpKeywords', ng="mpSupportedArchs" },
    { id='depends_skip_archcheck',     pre='1', gr='mpKeywords' },
    { id='installs_libs',                       gr='mpKeywords', ng='mpBool' },
    { id='license_noconflict',         pre='1', gr='mpKeywords' },

    { id='compiler.cpath',                      gr='mpKeywords' },
    { id='compiler.library_path',               gr='mpKeywords' },
    { id='compiler.log_verbose_output',         gr='mpKeywords', ng='mpBool' },
    { id='compiler.limit_flags',                gr='mpKeywords' },
    { id='compiler.support_environment_paths',  gr='mpKeywords' },
    { id='compiler.support_environment_sdkroot',gr='mpKeywords' },
    { id='add_users',                           gr='mpKeywords' },
    { id='use_xcode',                           gr='mpKeywords', ng='mpBool' },

    -- Variant nextgroup keywords
    { id='requires',                            gr='mpVariantRequires',  ng='mpVariantName', opts='contained' },
    { id='conflicts',                           gr='mpVariantConflicts', ng='mpVariantName', opts='contained' },
    { id='description',                         gr='mpVariantDescription',                   opts='contained' },



    -- portdepends.tcl -- Dependencies keywords
    -- ########################################

    { id='depends_fetch',              pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_extract',            pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_patch',              pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_build',              pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_run',                pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_lib',                pre='1', gr='mpKeywords', ng='mpDependsEntries' },
    { id='depends_test',               pre='1', gr='mpKeywords', ng='mpDependsEntries' },

    -- portfetch.tcl -- Fetch phase keywords
    -- #####################################

    { id='master_sites',               pre='1', gr='mpKeywords', ng='mpURL' },
    { id='patch_sites',                pre='1', gr='mpKeywords', ng='mpURL' },
    { id='extract.suffix',                      gr='mpKeywords' },
    { id='distfiles',                  pre='1', gr='mpKeywords' },
    { id='patchfiles',                 pre='1', gr='mpKeywords' },
    { id='use_tar',                             gr='mpKeywords', ng='mpBool' },
    { id='use_bzip2',                           gr='mpKeywords', ng='mpBool' },
    { id='use_lzma',                            gr='mpKeywords', ng='mpBool' },
    { id='use_xz',                              gr='mpKeywords', ng='mpBool' },
    { id='use_zip',                             gr='mpKeywords', ng='mpBool' },
    { id='use_7z',                              gr='mpKeywords', ng='mpBool' },
    { id='use_lzip',                            gr='mpKeywords', ng='mpBool' },
    { id='use_dmg',                             gr='mpKeywords', ng='mpBool' },
    { id='dist_subdir',                         gr='mpKeywords' },
    { id='fetch.type',                          gr='mpKeywords' },
    { id='fetch.user',                          gr='mpKeywords' },
    { id='fetch.password',                      gr='mpKeywords' },
    { id='fetch.use_epsv',                      gr='mpKeywords', ng='mpBool' },
    { id='fetch.ignore_sslcert',                gr='mpKeywords', ng='mpBool' },
    { id='fetch.user_agent',                    gr='mpKeywords', ng='mpBool' },
    { id='master_sites.mirror_subdir',          gr='mpKeywords' },
    { id='patch_sites.mirror_subdir',           gr='mpKeywords' },
    { id='bzr.url',                             gr='mpKeywords', ng='mpURL' },
    { id='bzr.revision',                        gr='mpKeywords' },
    { id='cvs.module',                          gr='mpKeywords' },
    { id='cvs.root',                            gr='mpKeywords' },
    { id='cvs.password',                        gr='mpKeywords' },
    { id='cvs.date',                            gr='mpKeywords' },
    { id='cvs.tag',                             gr='mpKeywords' },
    { id='cvs.method',                          gr='mpKeywords' },
    { id='svn.url',                             gr='mpKeywords', ng='mpURL' },
    { id='svn.revision',                        gr='mpKeywords' },
    { id='svn.method',                          gr='mpKeywords' },
    { id='git.cmd',                             gr='mpKeywords', ng='mpURL' },
    { id='git.url',                             gr='mpKeywords', ng='mpURL' },
    { id='git.branch',                          gr='mpKeywords' },
    { id='hg.cmd',                              gr='mpKeywords', ng='mpURL' },
    { id='hg.url',                              gr='mpKeywords', ng='mpURL' },
    { id='hg.tag',                              gr='mpKeywords' },

    -- portchecksum.tcl
    -- ################

    { id='checksums',                  pre='1', gr='mpKeywords', ng='mpChecksums' },
    { id='checksum.skip',                       gr='mpKeywords', ng='mpBool' },

    -- Checksums type keywords
    { id='sha256',                              gr='mpChecksumsType', opts='contained' },
    { id='rmd160',                              gr='mpChecksumsType', opts='contained' },
    { id='sha1',                                gr='mpChecksumsType', opts='contained' },
    { id='md5',                                 gr='mpChecksumsType', opts='contained' },
    { id='size',                                gr='mpChecksumsType', opts='contained' },

    -- portextrac.tcl -- Extract phase keywords
    -- ########################################

    { id='extract.only',               pre='1', gr='mpKeywords' },
    { id='extract.mkdir',                       gr='mpKeywords', ng='mpBool' },
    { id='extract.asroot',                      gr='mpKeywords', ng='mpBool' },
    { id='extract.dir',                         gr='mpKeywords', ng='mpBool' },
    { id='extract.cmd',                         gr='mpKeywords' },
    { id='extract.args',               pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='extract.pre_args',           pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='extract.post_args',          pre='1', gr='mpKeywords', ng='mpConfEntries' },

    -- portpatch.tcl -- Patch phase keywords
    -- #####################################

    { id='patch.asroot',                        gr='mpKeywords', ng='mpBool' },
    { id='patch.dir',                           gr='mpKeywords' },
    { id='patch.cmd',                           gr='mpKeywords' },
    { id='patch.args',                          gr='mpKeywords', ng='mpConfEntries' },
    { id='patch.pre_args',                      gr='mpKeywords', ng='mpConfEntries' },
    { id='patch.post_args',                     gr='mpKeywords', ng='mpConfEntries' },

    -- portconfigure.tcl -- Configure phase keywords
    -- #############################################

    -- C++ / Objective C++
    { id='configure.cxx',              pre='1', gr='mpKeywords' },
    { id='configure.cxx_archflags',    pre='1', gr='mpKeywords' },
    { id='configure.cxx_stdlib',       pre='1', gr='mpKeywords' },
    { id='configure.cxxflags',         pre='1', gr='mpKeywords' },
    { id='configure.objcxx',           pre='1', gr='mpKeywords' },
    { id='configure.objcxx_archflags', pre='1', gr='mpKeywords' },
    { id='configure.objcxxflags',      pre='1', gr='mpKeywords' },
    { id='configure.universal_cxxflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_objcxxflags', pre='1', gr='mpKeywords' },

    -- Fortran
    { id='compiler.require_fortran',            gr='mpKeywords', ng='mpBool' },
    { id='compiler.fortran_fallback',           gr='mpKeywords' },


    { id='configure.env',              pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.args',             pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.pre_args',         pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.post_args',        pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.cmd',              pre='1', gr='mpKeywords' },
    { id='configure.nice',             pre='1', gr='mpKeywords' },
    { id='configure.dir',                       gr='mpKeywords' },

    -- Automake, autoconf annd autoreconf keywords
    { id='autoreconf.dir',                      gr='mpKeywords' },
    { id='autoreconf.env',                      gr='mpKeywords', ng='mpConfEntries' },
    { id='autoreconf.args',                     gr='mpKeywords', ng='mpConfEntries' },
    { id='autoreconf.pre_args',                 gr='mpKeywords', ng='mpConfEntries' },
    { id='autoreconf.post_args',                gr='mpKeywords', ng='mpConfEntries' },
    { id='autoconf.dir',                        gr='mpKeywords' },
    { id='autoconf.env',                        gr='mpKeywords', ng='mpConfEntries' },
    { id='autoconf.args',                       gr='mpKeywords', ng='mpConfEntries' },
    { id='autoconf.pre_args',                   gr='mpKeywords', ng='mpConfEntries' },
    { id='autoconf.post_args',                  gr='mpKeywords', ng='mpConfEntries' },
    { id='automake.dir',                        gr='mpKeywords' },
    { id='automake.args',                       gr='mpKeywords', ng='mpConfEntries' },
    { id='xmkmf.cmd',                           gr='mpKeywords' },
    { id='xmkmf.dir',                           gr='mpKeywords' },

    { id='use_configure',                       gr='mpKeywords', ng='mpBool' },
    { id='use_autoreconf',                      gr='mpKeywords', ng='mpBool' },
    { id='use_automake',                        gr='mpKeywords', ng='mpBool' },
    { id='use_autoconf',                        gr='mpKeywords', ng='mpBool' },
    { id='use_xmkmf',                           gr='mpKeywords', ng='mpBool' },

    { id='autoreconf.cmd',                      gr='mpKeywords' },
    { id='automake.cmd',                        gr='mpKeywords' },
    { id='autoconf.cmd',                        gr='mpKeywords' },
    { id='xmkmf.cmd',                           gr='mpKeywords' },

    { id='configure.asroot',                    gr='mpKeywords', ng='mpBool' },
    { id='configure.m32',                       gr='mpKeywords' },
    { id='configure.m64',                       gr='mpKeywords' },
    { id='configure.march',                     gr='mpKeywords' },
    { id='configure.mtune',                     gr='mpKeywords' },
    { id='configure.optflags',         pre='1', gr='mpKeywords' },
    { id='configure.cflags',           pre='1', gr='mpKeywords' },
    { id='configure.objcflags',        pre='1', gr='mpKeywords' },
    { id='configure.cppflags',         pre='1', gr='mpKeywords' },
    { id='configure.ldflags',          pre='1', gr='mpKeywords' },
    { id='configure.libs',             pre='1', gr='mpKeywords' },
    { id='configure.fflags',           pre='1', gr='mpKeywords' },
    { id='configure.f90flags',         pre='1', gr='mpKeywords' },
    { id='configure.fcflags',          pre='1', gr='mpKeywords' },
    { id='configure.classpath',        pre='1', gr='mpKeywords' },

    -- tool section
    { id='configure.perl',                      gr='mpKeywords' },
    { id='configure.python',                    gr='mpKeywords' },
    { id='configure.ruby',                      gr='mpKeywords' },
    { id='configure.install',                   gr='mpKeywords' },
    { id='configure.awk',                       gr='mpKeywords' },
    { id='configure.bison',                     gr='mpKeywords' },
    { id='configure.pkg_config',       pre='1', gr='mpKeywords' },
    { id='configure.pkg_config_path',  pre='1', gr='mpKeywords' },

    { id='configure.build_arch',                gr='mpKeywords' },
    { id='configure.ld_archflags',              gr='mpKeywords' },
    { id='configure.sdk_version',               gr='mpKeywords' },
    { id='configure.sdkroot',                   gr='mpKeywords' },
    { id='configure.sysroot',                   gr='mpKeywords' },
    { id='configure.developer_dir',             gr='mpKeywords' },
    { id='configure.universal_archs',  pre='1', gr='mpKeywords' },
    { id='configure.universal_args',   pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='configure.universal_cflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_objcflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_cppflags', pre='1', gr='mpKeywords' },
    { id='configure.universal_ldflags',  pre='1', gr='mpKeywords' },

    -- Select a distinct compiler
    { id='configure.ccache',                    gr='mpKeywords', ng='mpBool' },
    { id='configure.distcc',                    gr='mpKeywords', ng='mpBool' },
    { id='configure.pipe',                      gr='mpKeywords', ng='mpBool' },
    { id='configure.cc',               pre='1', gr='mpKeywords' },
    { id='configure.cpp',              pre='1', gr='mpKeywords' },
    { id='configure.objc',             pre='1', gr='mpKeywords' },
    { id='configure.f77',              pre='1', gr='mpKeywords' },
    { id='configure.f90',              pre='1', gr='mpKeywords' },
    { id='configure.fc',               pre='1', gr='mpKeywords' },
    { id='configure.javac',            pre='1', gr='mpKeywords' },
    { id='configure.compiler',         pre='1', gr='mpKeywords' },
    { id='compiler.blacklist',         pre='1', gr='mpKeywords' },
    { id='compiler.whitelist',                  gr='mpKeywords' },
    { id='compiler.fallback',          pre='1', gr='mpKeywords' },

    { id='configure.cc_archflags',              gr='mpKeywords' },
    { id='configure.objc_archflags',            gr='mpKeywords' },
    { id='configure.f77_archflags',             gr='mpKeywords' },
    { id='configure.f90_archflags',             gr='mpKeywords' },
    { id='configure.fc_archflags',              gr='mpKeywords' },

    -- Compiler Restrictions
    { id='compiler.c_standard',                 gr='mpKeywords' },
    { id='compiler.cxx_standard',               gr='mpKeywords' },
    { id='compiler.openmp_version',             gr='mpKeywords' },
    { id='compiler.mpi',                        gr='mpKeywords' },
    { id='compiler.thread_local_storage',       gr='mpKeywords' },

    { id='configure.compiler.add_deps',         gr='mpKeywords', ng='mpBool' },
    { id='configure.checks.implicit_function_declaration', gr='mpKeywords', ng='mpBool' },
    { id='configure.checks.implicit_function_declaration.whitelist', pre='1', gr='mpKeywords' },

    -- portbuild.tcl -- Build phase keywords
    -- #####################################

    { id='build.asroot',                        gr='mpKeywords', ng='mpBool' },
    { id='build.jobs',                          gr='mpKeywords' },
    { id='build.target',               pre='1', gr='mpKeywords' },
    { id='use_parallel_build',                  gr='mpKeywords', ng='mpBool' },
    { id='build.dir',                           gr='mpKeywords' },
    { id='build.cmd',                           gr='mpKeywords' },
    { id='build.nice',                          gr='mpKeywords' },
    { id='build.args',                 pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='build.pre_args',             pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='build.post_args',            pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='build.type',                          gr='mpKeywords' },
    { id='build.env',                  pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='build.type.add_deps',                 gr='mpKeywords', ng='mpBool' },

    -- portdestroot.tcl -- Destroot phase keywords
    -- ###########################################

    { id='destroot.target',            pre='1', gr='mpKeywords' },
    { id='destroot.destdir',                    gr='mpKeywords' },
    { id='destroot.clean',                      gr='mpKeywords', ng='mpBool' },
    { id='destroot.keepdirs',                   gr='mpKeywords' },
    { id='destroot.umask',                      gr='mpKeywords' },
    { id='destroot.violate_mtree',              gr='mpKeywords', ng='mpBool' },
    { id='destroot.asroot',                     gr='mpKeywords', ng='mpBool' },
    { id='destroot.delete_la_files',            gr='mpKeywords', ng='mpBool' },

    { id='destroot.dir',                        gr='mpKeywords' },
    { id='destroot.cmd',                        gr='mpKeywords' },
    { id='destroot.args',              pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='destroot.pre_args',          pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='destroot.post_args',         pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='destroot.nice',                       gr='mpKeywords' },
    { id='destroot.env',               pre='1', gr='mpKeywords', ng='mpConfEntries' },

    -- portinstall.tcl -- Install phase keywords
    -- #########################################

    { id='install.asroot',                      gr='mpKeywords', ng='mpBool' },

    -- portuninstall.tcl -- Uninstall phase keywords
    -- #############################################

    { id='uninstall.asroot',                    gr='mpKeywords', ng='mpBool' },

    -- portactivate.tcl -- Activate phase keywords
    -- ###########################################

    { id='activate.asroot',                     gr='mpKeywords', ng='mpBool' },

    -- portdeactivate.tcl -- Deactivate phase keywords
    -- ###############################################

    { id='deactivate.asroot',                   gr='mpKeywords', ng='mpBool' },

    -- porttest.tcl -- Test phase keywords
    -- ###################################

    { id='test.run',                            gr='mpKeywords', ng='mpBool' },
    { id='test.target',                pre='1', gr='mpKeywords' },
    { id='test.dir',                            gr='mpKeywords' },
    { id='test.cmd',                            gr='mpKeywords' },
    { id='test.args',                  pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='test.pre_args',              pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='test.post_args',             pre='1', gr='mpKeywords', ng='mpConfEntries' },
    { id='test.env',                   pre='1', gr='mpKeywords', ng='mpConfEntries' },

    -- portdistcheck.tcl
    -- #################

    { id='distcheck.type',                      gr='mpKeywords' },

    -- portlivecheck.tcl -- Livecheck keywords
    -- #######################################

    { id='livecheck.url',                       gr='mpKeywords', ng='mpURL' },
    { id='livecheck.type',                      gr='mpKeywords' },
    { id='livecheck.md5',                       gr='mpKeywords' },
    { id='livecheck.regex',                     gr='mpKeywords' },
    { id='livecheck.name',                      gr='mpKeywords' },
    { id='livecheck.distname',                  gr='mpKeywords' },
    { id='livecheck.version',                   gr='mpKeywords' },
    { id='livecheck.ignore_sslcert',            gr='mpKeywords', ng='mpBool' },
    { id='livecheck.compression',               gr='mpKeywords', ng='mpBool' },
    { id='livecheck.curloptions',               gr='mpKeywords' },

    -- portstartupitem.tcl -- Startupitems keywords
    -- ############################################

    { id='startupitem',                         gr='mpKeywords' },
    { id='startupitem.autostart',               gr='mpKeywords', ng='mpBool' },
    { id='startupitem.debug',                   gr='mpKeywords', ng='mpBool' },
    { id='startupitem.create',                  gr='mpKeywords', ng='mpBool' },
    { id='startupitem.executable',              gr='mpKeywords' },
    { id='startupitem.user',                    gr='mpKeywords' },
    { id='startupitem.group',                   gr='mpKeywords' },
    { id='startupitem.init',                    gr='mpKeywords' },
    { id='startupitem.install',                 gr='mpKeywords', ng='mpBool' },
    { id='startupitem.location',                gr='mpKeywords' },
    { id='startupitem.logevents',               gr='mpKeywords', ng='mpBool' },
    { id='startupitem.logfile',                 gr='mpKeywords' },
    { id='startupitem.name',                    gr='mpKeywords' },
    { id='startupitem.netchange',               gr='mpKeywords', ng='mpBool' },
    { id='startupitem.pidfile',                 gr='mpKeywords', ng='mpStartupPid' },
    { id='startupitem.plist',                   gr='mpKeywords' },
    { id='startupitem.requires',                gr='mpKeywords' },
    { id='startupitem.restart',                 gr='mpKeywords' },
    { id='startupitem.start',                   gr='mpKeywords' },
    { id='startupitem.stop',                    gr='mpKeywords' },
    { id='startupitem.type',                    gr='mpKeywords' },
    { id='startupitem.uniquename',              gr='mpKeywords' },
    { id='startupitem.daemondo.verbosity',      gr='mpKeywords' },

    { id='none',                                gr='mpStartupPid', opts='contained' },
    { id='auto',                                gr='mpStartupPid', opts='contained' },
    { id='clean',                               gr='mpStartupPid', opts='contained' },
    { id='manual',                              gr='mpStartupPid', opts='contained' },

    -- portload.tcl
    -- ############

    { id='load.asroot',                         gr='mpKeywords', ng='mpBool' },

    -- portunload.tcl
    -- ##############

    { id='unload.asroot',                       gr='mpKeywords', ng='mpBool' },

    -- portreload.tcl
    -- ##############

    { id='reload.asroot',                       gr='mpKeywords', ng='mpBool' },

    -- Platform name and arch nextgroup keywords
    -- #########################################

    { id='darwin',                              gr='mpPlatformName', opts='contained' },
    { id='macosx',                              gr='mpPlatformName', opts='contained' },
    { id='puredarwin',                          gr='mpPlatformName', opts='contained' },
    { id='freebsd',                             gr='mpPlatformName', opts='contained' },
    { id='linux',                               gr='mpPlatformName', opts='contained' },
    { id='netbsd',                              gr='mpPlatformName', opts='contained' },
    { id='openbsd',                             gr='mpPlatformName', opts='contained' },
    { id='solaris',                             gr='mpPlatformName', opts='contained' },
    { id='sunos',                               gr='mpPlatformName', opts='contained' },

    { id='arm',                                 gr='mpPlatformArch', opts='contained' },
    { id='arm64',                               gr='mpPlatformArch', opts='contained' },
    { id='i386',                                gr='mpPlatformArch', opts='contained' },
    { id='ppc',                                 gr='mpPlatformArch', opts='contained' },
    { id='ppc64',                               gr='mpPlatformArch', opts='contained' },
    { id='powerpc',                             gr='mpPlatformArch', opts='contained' },
    { id='x86_64',                              gr='mpPlatformArch', opts='contained' },
    { id='noarch',                              gr='mpPlatformArch', opts='contained' },

    -- Tcl and Tcl extensions keywords
    -- ###############################

    { id='if',                                  gr='mpKeywords' },
    { id='else',                                gr='mpKeywords' },
    { id='elseif',                              gr='mpKeywords' },
    { id='set',                                 gr='mpKeywords' },
    { id='incr',                                gr='mpKeywords' },
    { id='switch',                              gr='mpKeywords' },
    { id='variant_isset',                       gr='mpKeywords' },
    { id='variant_set',                         gr='mpKeywords' },

    { id='set',                                 gr='mpTcl', opts='contained' },
    { id='switch',                              gr='mpTcl', opts='contained' },
    { id='xinstall',                            gr='mpTcl', opts='contained' },
    { id='exec',                                gr='mpTcl', opts='contained' },
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

    -- Categories names
    -- ################

    { id='aqua',                                gr='mpCategoriesName', opts='contained' },
    { id='archivers',                           gr='mpCategoriesName', opts='contained' },
    { id='audio',                               gr='mpCategoriesName', opts='contained' },
    { id='benchmarks',                          gr='mpCategoriesName', opts='contained' },
    { id='cad',                                 gr='mpCategoriesName', opts='contained' },
    { id='comms',                               gr='mpCategoriesName', opts='contained' },
    { id='cross',                               gr='mpCategoriesName', opts='contained' },
    { id='databases',                           gr='mpCategoriesName', opts='contained' },
    { id='devel',                               gr='mpCategoriesName', opts='contained' },
    { id='dotnet',                              gr='mpCategoriesName', opts='contained' },
    { id='editors',                             gr='mpCategoriesName', opts='contained' },
    { id='emulators',                           gr='mpCategoriesName', opts='contained' },
    { id='erlang',                              gr='mpCategoriesName', opts='contained' },
    { id='finance',                             gr='mpCategoriesName', opts='contained' },
    { id='fuse',                                gr='mpCategoriesName', opts='contained' },
    { id='games',                               gr='mpCategoriesName', opts='contained' },
    { id='genealogy',                           gr='mpCategoriesName', opts='contained' },
    { id='gis',                                 gr='mpCategoriesName', opts='contained' },
    { id='gnome',                               gr='mpCategoriesName', opts='contained' },
    { id='gnustep',                             gr='mpCategoriesName', opts='contained' },
    { id='graphics',                            gr='mpCategoriesName', opts='contained' },
    { id='haskell',                             gr='mpCategoriesName', opts='contained' },
    { id='irc',                                 gr='mpCategoriesName', opts='contained' },
    { id='janet',                               gr='mpCategoriesName', opts='contained' },
    { id='java',                                gr='mpCategoriesName', opts='contained' },
    { id='kde',                                 gr='mpCategoriesName', opts='contained' },
    { id='lang',                                gr='mpCategoriesName', opts='contained' },
    { id='lua',                                 gr='mpCategoriesName', opts='contained' },
    { id='mail',                                gr='mpCategoriesName', opts='contained' },
    { id='math',                                gr='mpCategoriesName', opts='contained' },
    { id='multimedia',                          gr='mpCategoriesName', opts='contained' },
    { id='net',                                 gr='mpCategoriesName', opts='contained' },
    { id='news',                                gr='mpCategoriesName', opts='contained' },
    { id='ocaml',                               gr='mpCategoriesName', opts='contained' },
    { id='office',                              gr='mpCategoriesName', opts='contained' },
    { id='palm',                                gr='mpCategoriesName', opts='contained' },
    { id='perl',                                gr='mpCategoriesName', opts='contained' },
    { id='php',                                 gr='mpCategoriesName', opts='contained' },
    { id='print',                               gr='mpCategoriesName', opts='contained' },
    { id='pure',                                gr='mpCategoriesName', opts='contained' },
    { id='python',                              gr='mpCategoriesName', opts='contained' },
    { id='ruby',                                gr='mpCategoriesName', opts='contained' },
    { id='scheme',                              gr='mpCategoriesName', opts='contained' },
    { id='science',                             gr='mpCategoriesName', opts='contained' },
    { id='security',                            gr='mpCategoriesName', opts='contained' },
    { id='shells',                              gr='mpCategoriesName', opts='contained' },
    { id='sysutils',                            gr='mpCategoriesName', opts='contained' },
    { id='tex',                                 gr='mpCategoriesName', opts='contained' },
    { id='textproc',                            gr='mpCategoriesName', opts='contained' },
    { id='www',                                 gr='mpCategoriesName', opts='contained' },
    { id='x11',                                 gr='mpCategoriesName', opts='contained' },
    { id='xfce',                                gr='mpCategoriesName', opts='contained' },

    -- +-------------+
    -- | PORT GROUPS |
    -- +-------------+

    -- PortGroup names
    -- ###############

    { id='active_variants',                     gr='mpPortGroupName', opts='contained' },
    { id='apache2',                             gr='mpPortGroupName', opts='contained' },
    { id='app',                                 gr='mpPortGroupName', opts='contained' },
    { id='aspelldict',                          gr='mpPortGroupName', opts='contained' },
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
    { id='crossgdb',                            gr='mpPortGroupName', opts='contained' },
    { id='debug',                               gr='mpPortGroupName', opts='contained' },
    { id='deprecated',                          gr='mpPortGroupName', opts='contained' },
    { id='developerversion',                    gr='mpPortGroupName', opts='contained' },
    { id='elisp',                               gr='mpPortGroupName', opts='contained' },
    { id='fuse',                                gr='mpPortGroupName', opts='contained' },
    { id='gitea',                               gr='mpPortGroupName', opts='contained' },
    { id='github',                              gr='mpPortGroupName', opts='contained' },
    { id='gitlab',                              gr='mpPortGroupName', opts='contained' },
    { id='gnu_info',                            gr='mpPortGroupName', opts='contained' },
    { id='gnuradio',                            gr='mpPortGroupName', opts='contained' },
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
    { id='npm',                                 gr='mpPortGroupName', opts='contained' },
    { id='obsolete',                            gr='mpPortGroupName', opts='contained' },
    { id='ocaml',                               gr='mpPortGroupName', opts='contained' },
    { id='octave',                              gr='mpPortGroupName', opts='contained' },
    { id='openssl',                             gr='mpPortGroupName', opts='contained' },
    { id='perl5',                               gr='mpPortGroupName', opts='contained' },
    { id='php',                                 gr='mpPortGroupName', opts='contained' },
    { id='pure',                                gr='mpPortGroupName', opts='contained' },
    { id='python',                              gr='mpPortGroupName', opts='contained' },
    { id='qmake',                               gr='mpPortGroupName', opts='contained' },
    { id='qmake5',                              gr='mpPortGroupName', opts='contained' },
    { id='qt4',                                 gr='mpPortGroupName', opts='contained' },
    { id='qt5',                                 gr='mpPortGroupName', opts='contained' },
    { id='qt6',                                 gr='mpPortGroupName', opts='contained' },
    { id='ruby',                                gr='mpPortGroupName', opts='contained' },
    { id='rust',                                gr='mpPortGroupName', opts='contained' },
    { id='select',                              gr='mpPortGroupName', opts='contained' },
    { id='sourcehut',                           gr='mpPortGroupName', opts='contained' },
    { id='stub',                                gr='mpPortGroupName', opts='contained' },
    { id='texlive',                             gr='mpPortGroupName', opts='contained' },
    { id='waf',                                 gr='mpPortGroupName', opts='contained' },
    { id='wxWidgets',                           gr='mpPortGroupName', opts='contained' },
    { id='x11font',                             gr='mpPortGroupName', opts='contained' },
    { id='xcode',                               gr='mpPortGroupName', opts='contained' },
    { id='xcode_workaround',                    gr='mpPortGroupName', opts='contained' },
    { id='xcodeversion',                        gr='mpPortGroupName', opts='contained' },
    { id='xmlcatalog',                          gr='mpPortGroupName', opts='contained' },
    { id='yelp',                                gr='mpPortGroupName', opts='contained' },

    -- active_variants (1.1) keywords
    -- ##############################

    { id='active_variants',                     gr='mpKeywords' },
    { id='require_active_variants',             gr='mpKeywords' },

    -- app keywords
    -- ############

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

    -- aspelldict keywords
    -- ###################

    { id='aspelldict.setup',                    gr='mpKeywords' },

    -- bazel keywords
    -- ##############

    { id='bazel.version',                       gr='mpKeywords' },
    { id='bazel.min_xcode',                     gr='mpKeywords' },
    { id='bazel.build_cmd',            pre='1', gr='mpKeywords' },
    { id='bazel.build_cmd_opts',       pre='1', gr='mpKeywords' },
    { id='bazel.build_opts',           pre='1', gr='mpKeywords' },
    { id='bazel.build_target',         pre='1', gr='mpKeywords' },
    { id='bazel.run_bazel_fetch',               gr='mpKeywords', ng='mpBool' },
    { id='bazel.post_build_cmd',       pre='1', gr='mpKeywords' },
    { id='bazel.max_idle_secs',                 gr='mpKeywords' },
    { id='bazel.max_cpu_fraction',              gr='mpKeywords' },
    { id='bazel.max_ram_fraction',              gr='mpKeywords' },
    { id='bazel.limit_build_jobs',              gr='mpKeywords', ng='mpBool' },
    { id='bazel.extra_build_cmd_opts', pre='1', gr='mpKeywords' },
    { id='bazel.extra_build_opts',     pre='1', gr='mpKeywords' },
    { id='bazel.configure_cmd',        pre='1', gr='mpKeywords' },
    { id='bazel.configure_args',       pre='1', gr='mpKeywords' },
    { id='bazel.configure_pre_args',   pre='1', gr='mpKeywords' },
    { id='bazel.cxx_standard',                  gr='mpKeywords' },
    { id='bazel.path',                          gr='mpKeywords' },
    { id='bazel.python_version',                gr='mpKeywords' },
    { id='bazel.fix_wheel_deployment_target',   gr='mpKeywords', ng='mpBool' },

    -- bitbucket keywords
    -- ##################

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
    -- ##############

    { id='boost.version',                       gr='mpKeywords' },
    { id='boost.depends_type',                  gr='mpKeywords' },
    { id='boost.require_numpy',                 gr='mpKeywords', ng='mpBool' },

    -- cargo keywords
    -- ##############

    { id='cargo.bin',                           gr='mpKeywords' },
    { id='cargo.home',                          gr='mpKeywords' },
    { id='cargo.crates',                        gr='mpKeywords' },
    { id='cargo.crates_github',                 gr='mpKeywords' },

    -- clang_dependency keywords
    -- #########################

    { id='clang_dependency.extra_versions',     gr='mpKeywords' },

    -- cmake keywords
    -- ##############

    { id='cmake.build_dir',                     gr='mpKeywords' },
    { id='cmake.source_dir',                    gr='mpKeywords' },
    { id='cmake.generator',                     gr='mpKeywords' },
    { id='cmake.generator_blacklist',           gr='mpKeywords' },
    { id='cmake.build_type',                    gr='mpKeywords' },
    { id='cmake.install_prefix',       pre='1', gr='mpKeywords' },
    { id='cmake.install_rpath',        pre='1', gr='mpKeywords' },
    { id='cmake.module_path',          pre='1', gr='mpKeywords' },
    { id='cmake.out_of_source',                 gr='mpKeywords', ng='mpBool' },
    { id='cmake.set_osx_architectures',         gr='mpKeywords', ng='mpBool' },
    { id='cmake.set_c_standard',                gr='mpKeywords', ng='mpBool' },
    { id='cmake.set_cxx_standard',              gr='mpKeywords', ng='mpBool' },

    -- compiler_wrapper keywords
    -- #########################

    { id='compwrap.add_compiler_flags',         gr='mpKeywords', ng='mpBool' },
    { id='compwrap.add_legacysupport_flags',    gr='mpKeywords', ng='mpBool' },
    { id='compwrap.print_compiler_command',     gr='mpKeywords', ng='mpBool' },
    { id='compwrap.append_arch_flags',          gr='mpKeywords', ng='mpBool' },
    { id='compwrap.compiler_pre_flags',         gr='mpKeywords' },
    { id='compwrap.compiler_post_flags',        gr='mpKeywords' },
    { id='compwrap.compiler_args_forward',      gr='mpKeywords' },
    { id='compwrap.compilers_to_wrap',          gr='mpKeywords' },
    { id='compwrap.ccache_supported_compilers', gr='mpKeywords' },

    -- compilers keywords
    -- ##################

    { id='compilers.variants',                  gr='mpKeywords' },
    { id='compilers.gcc_variants',              gr='mpKeywords' },
    { id='compilers.clear_archflags',           gr='mpKeywords' },
    { id='compilers.allow_arguments_mismatch',  gr='mpKeywords', ng='mpBool' },

    -- conflicts_build keyword
    -- #######################

    { id='conflicts_build',                     gr='mpKeywords' },

    -- crossbinutils keywords
    -- ######################

    { id='crossbinutils.target',                gr='mpKeywords' },
    { id='crossbinutils.setup',                 gr='mpKeywords' },

    -- crossgcc keywords
    -- #################

    { id='crossgcc.target',                     gr='mpKeywords' },
    { id='crossgcc.languages',         pre='1', gr='mpKeywords' },
    { id='crossgcc.setup',                      gr='mpKeywords' },
    { id='crossgcc.setup_libc',                 gr='mpKeywords' },

    -- crossgdb keywords
    -- #################

    { id='crossgdb.setup',                      gr='mpKeywords' },

    -- deprecated keywords
    -- ###################

    { id='deprecated.maximum_xcodeversion',     gr='mpKeywords' },
    { id='deprecated.maximum_osmajor',          gr='mpKeywords' },
    { id='deprecated.upstream_support',         gr='mpKeywords', ng='mpBool' },
    { id='deprecated.macports_support',         gr='mpKeywords', ng='mpBool' },
    { id='deprecated.eol_version',              gr='mpKeywords', ng='mpBool' },

    -- developerversion keywords
    -- #########################

    { id='minimum_developerversions',           gr='mpKeywords' },

    -- gitea keywords
    -- ##############

    { id='gitea.author',                        gr='mpKeywords' },
    { id='gitea.project',                       gr='mpKeywords' },
    { id='gitea.version',                       gr='mpKeywords' },
    { id='gitea.tag_prefix',                    gr='mpKeywords' },
    { id='gitea.tag_suffix',                    gr='mpKeywords' },
    { id='gitea.domain',                        gr='mpKeywords' },
    { id='gitea.homepage',                      gr='mpKeywords' },
    { id='gitea.master_sites',                  gr='mpKeywords' },
    { id='gitea.livecheck.branch',              gr='mpKeywords' },
    { id='gitea.livecheck.regex',               gr='mpKeywords' },

    -- github keywords
    -- ###############

    { id='github.author',                       gr='mpKeywords' },
    { id='github.project',                      gr='mpKeywords' },
    { id='github.version',                      gr='mpKeywords' },
    { id='github.tag_prefix',                   gr='mpKeywords' },
    { id='github.tag_suffix',                   gr='mpKeywords' },
    { id='github.homepage',                     gr='mpKeywords' },
    { id='github.raw',                          gr='mpKeywords' },
    { id='github.master_sites',                 gr='mpKeywords' },
    { id='github.tarball_from',                 gr='mpKeywords' },
    { id='github.livecheck.branch',             gr='mpKeywords' },
    { id='github.livecheck.regex',              gr='mpKeywords' },
    { id='github.setup',                        gr='mpKeywords' },

    -- gitlab keywords
    -- ###############

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
    -- #################

    { id='gnu_info.name',                       gr='mpKeywords' },
    { id='gnu_info.files',                      gr='mpKeywords' },
    { id='gnu_info.dir',                        gr='mpKeywords' },
    { id='gnu_info.dirfile',                    gr='mpKeywords' },
    { id='gnu_info.install_info',               gr='mpKeywords' },

    -- gnuradio keywords
    -- #################

    { id='gnuradio.type',                       gr='mpKeywords' },
    { id='gnuradio.python_version',             gr='mpKeywords' },

    -- gnustep keywords
    -- ################

    { id='gnustep.cc',                          gr='mpKeywords' },

    -- gobject_introspection keywords
    -- ##############################

    { id='gobject_introspection',               gr='mpKeywords', mp='mpBool' },

    -- golang keywords
    -- ###############

    { id='go.package',                          gr='mpKeywords' },
    { id='go.domain',                           gr='mpKeywords' },
    { id='go.author',                           gr='mpKeywords' },
    { id='go.project',                          gr='mpKeywords' },
    { id='go.version',                          gr='mpKeywords' },
    { id='go.tag_prefix',                       gr='mpKeywords' },
    { id='go.tag_suffix',                       gr='mpKeywords' },
    { id='go.bin',                              gr='mpKeywords' },
    { id='go.vendors',                          gr='mpKeywords' },
    { id='go.setup',                            gr='mpKeywords' },
    { id='go.vendors',                          gr='mpKeywords' },

    -- gpg_verify keywords
    -- ###################

    { id='gpg_verify.use_gpg_verification',     gr='mpKeywords', ng='mpBool' },
    { id='gpg_verify.gpg',                      gr='mpKeywords' },
    { id='gpg_verify.gpg_homedir',              gr='mpKeywords' },

    -- haskell_stack keywords
    -- ######################

    { id='haskell_stack.system_ghc',            gr='mpKeywords', ng='mpBool' },
    { id='haskell_stack.stack_root',            gr='mpKeywords' },

    -- hunspelldict keywords
    -- #####################

    { id='hunspelldict.locale',                 gr='mpKeywords' },
    { id='hunspelldict.setup',                  gr='mpKeywords' },

    -- janet keywords
    -- ##############

    { id='janet.link_bin',                      gr='mpKeywords', ng='mpBool' },

    -- java keywords
    -- #############

    { id='java.version',                        gr='mpKeywords' },
    { id='java.home',                           gr='mpKeywords' },
    { id='java.fallback',                       gr='mpKeywords' },

    -- legacysupport (1.0 and 1.1) keywords
    -- ####################################

    { id='legacysupport.newest_darwin_requires_legacy', gr='mpKeywords' },
    { id='legacysupport.use_static',            gr='mpKeywords', ng='mpBool' },
    { id='legacysupport.redirect_bins',         gr='mpKeywords' },
    { id='legacysupport.use_mp_libcxx',         gr='mpKeywords', ng='mpBool'},
    { id='compiler.limit_flags',                gr='mpKeywords', ng='mpBool' },

    -- linear_algebra keywords
    -- #######################

    { id='linalglib',                           gr='mpKeywords' },
    { id='cmake_linalglib',                     gr='mpKeywords' },
    { id='blas_only',                           gr='mpKeywords', ng='mpBool' },
    { id='veclibfort',                          gr='mpKeywords', ng='mpBool' },
    { id='linalg.setup',                        gr='mpKeywords' },

    -- luarocks keywords
    -- #################

    { id='luarocks.default_branch',             gr='mpKeywords' },
    { id='luarocks.branch',                     gr='mpKeywords' },
    { id='luarocks.branches',                   gr='mpKeywords' },
    { id='luarocks.dependencies',               gr='mpKeywords' },
    { id='luarocks.bin',                        gr='mpKeywords' },
    { id='luarocks.bindir',                     gr='mpKeywords' },
    { id='luarocks.rocksdir',                   gr='mpKeywords' },
    { id='luarocks.suffix',                     gr='mpKeywords' },
    { id='luarocks.link_binaries',              gr='mpKeywords', ng='mpBool' },
    { id='luarocks.link_binaries_suffix',       gr='mpKeywords' },
    { id='luarocks.setup',                      gr='mpKeywords' },

    -- makefile keywords
    -- #################

    { id='makefile.override',          pre='1', gr='mpKeywords' },
    { id='makefile.has_destdir',                gr='mpKeywords', ng='mpBool' },
    { id='makefile.prefix_name',                gr='mpKeywords' },
    { id='muniversal.arch_tools',               gr='mpKeywords' },
    { id='makefile.setup',                      gr='mpKeywords' },

    -- muniversal keywords
    -- ###################

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

    -- npm keywords
    -- ############

    { id='npm.rootname',                        gr='mpKeywords' },
    { id='npm.nodejs_version',                  gr='mpKeywords' },
    { id='npm.version',                         gr='mpKeywords' },

    -- ocaml (1.0 and 1.1) keywords
    -- ############################

    { id='ocaml.bin',                           gr='mpKeywords' },
    { id='ocaml.build_type',                    gr='mpKeywords' },
    { id='ocaml.destroot_type',                 gr='mpKeywords' },
    { id='ocaml.package_dir',                   gr='mpKeywords' },
    { id='ocaml.stublib_dir',                   gr='mpKeywords' },
    { id='ocaml.use_findlib',                   gr='mpKeywords', ng='mpBool' },
    { id='ocaml.setup',                         gr='mpKeywords' },
    { id='oasis.setup',                         gr='mpKeywords' },
    { id='oasis.build_docs',                    gr='mpKeywords', ng='mpBool' },
    { id='dune.root',                           gr='mpKeywords' },
    { id='dune.packages',                       gr='mpKeywords' },
    { id='dune.profile',                        gr='mpKeywords' },
    { id='dune.build.target',                   gr='mpKeywords' },
    { id='topkg.setup',                         gr='mpKeywords' },

    -- octave keywords
    -- ###############

    { id='octave.module',                       gr='mpKeywords' },
    { id='octave.config_h',                     gr='mpKeywords', ng='mpBool' },
    { id='octave.setup',                        gr='mpKeywords' },

    -- openssl keywords
    -- ################

    { id='openssl.branch',                      gr='mpKeywords' },
    { id='openssl.depends_type',                gr='mpKeywords' },
    { id='openssl.configure',                   gr='mpKeywords' },

    -- perl5 keywords
    -- ##############

    { id='perl5.branch',                        gr='mpKeywords' },
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
    { id='perl5.lib',                           gr='mpKeywords' },
    { id='perl5.bindir',                        gr='mpKeywords' },
    { id='perl5.archlib',                       gr='mpKeywords' },
    { id='perl5.bin',                           gr='mpKeywords' },
    { id='perl5.link_binaries',                 gr='mpKeywords', ng='mpBool' },
    { id='perl5.link_binaries_suffix',          gr='mpKeywords' },
    { id='perl5.use_module_build',              gr='mpKeywords' },
    { id='perl5.create_variants',               gr='mpKeywords' },
    { id='perl5.setup',                         gr='mpKeywords' },

    -- php (1.1) keywords
    -- ##################

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
    { id='php.pecl.prerelease',                 gr='mpKeywords', ng='mpBool' },
    { id='php.pecl.regex',                      gr='mpKeywords' },
    { id='php.branch',                          gr='mpKeywords' },
    { id='php.config',                          gr='mpKeywords' },
    { id='php.extension_dir',                   gr='mpKeywords' },
    { id='php.ini',                             gr='mpKeywords' },
    { id='php.ini_dir',                         gr='mpKeywords' },
    { id='php.ize',                             gr='mpKeywords' },
    { id='php.suffix',                          gr='mpKeywords' },

    -- pure keywords
    -- #############

    { id='pure.setup',                          gr='mpKeywords' },

    -- python keywords
    -- ###############

    { id='python.rootname',                     gr='mpKeywords' },
    { id='python.versions',                     gr='mpKeywords' },
    { id='python.version',                      gr='mpKeywords' },
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
    { id='python.pep517_backend',               gr='mpKeywords' },
    { id='python.add_dependencies',             gr='mpKeywords' },
    { id='python.add_archflags',                gr='mpKeywords', ng='mpBool' },
    { id='python.set_compiler',                 gr='mpKeywords', ng='mpBool' },
    { id='python.set_cxx_stdlib',               gr='mpKeywords', ng='mpBool' },
    { id='python.set_sdkroot',                  gr='mpKeywords', ng='mpBool' },
    { id='python.link_binaries',                gr='mpKeywords', ng='mpBool' },
    { id='python.link_binaries_suffix',         gr='mpKeywords' },
    { id='python.move_binaries',                gr='mpKeywords', ng='mpBool' },
    { id='python.move_binaries_suffix',         gr='mpKeywords' },

    -- qmake annd qmake5 keywords
    -- ##########################

    { id='qt4.debug_variant',                   gr='mpKeywords', ng='mpBool' },
    { id='qt5.add_spec',                        gr='mpKeywords', ng='mpBool' },
    { id='qt5.debug_variant',                   gr='mpKeywords', ng='mpBool' },
    { id='qt5.top_level',                       gr='mpKeywords' },
    { id='qt5.cxxflags',               pre='1', gr='mpKeywords' },
    { id='qt5.ldflags',                         gr='mpKeywords' },
    { id='qt5.frameworkpaths',         pre='1', gr='mpKeywords' },
    { id='qt5.spec_cmd',                        gr='mpKeywords' },

    -- qt5 keywords
    -- ############

    { id='qt5.depends_component',               gr='mpKeywords' },
    { id='qt5.depends_build_component',         gr='mpKeywords' },
    { id='qt5.depends_runtime_component',       gr='mpKeywords' },
    { id='qt5.kde_variant',                     gr='mpKeywords' },
    { id='qt5.min_version',                     gr='mpKeywords' },

    -- qt6 keywords
    -- ############

    { id='available_qt_versions',               gr='mpKeywords' },
    { id='qt6.name',                            gr='mpKeywords' },
    { id='qt6.base_port',                       gr='mpKeywords' },
    { id='qt6.version',                         gr='mpKeywords' },
    { id='qt6.min_version',                     gr='mpKeywords' },
    { id='qt_qmake_spec',                       gr='mpKeywords' },

    -- ruby keywords
    -- #############

    { id='ruby.default_branch',                 gr='mpKeywords' },
    { id='ruby.branch',                         gr='mpKeywords' },
    { id='ruby.branches',                       gr='mpKeywords' },
    { id='ruby.bin',                            gr='mpKeywords' },
    { id='ruby.rdoc',                           gr='mpKeywords' },
    { id='ruby.gem',                            gr='mpKeywords' },
    { id='ruby.rake',                           gr='mpKeywords' },
    { id='ruby.bindir',                         gr='mpKeywords' },
    { id='ruby.gemdir',                         gr='mpKeywords' },
    { id='ruby.suffix',                         gr='mpKeywords' },
    { id='ruby.api_version',                    gr='mpKeywords' },
    { id='ruby.lib',                            gr='mpKeywords' },
    { id='ruby.archlib',                        gr='mpKeywords' },
    { id='ruby.version',                        gr='mpKeywords' },
    { id='ruby.arch',                           gr='mpKeywords' },
    { id='ruby.config_rubyprog_name',           gr='mpKeywords' },
    { id='ruby.link_binaries',                  gr='mpKeywords', ng='mpBool' },
    { id='ruby.link_binaries_suffix',           gr='mpKeywords' },
    { id='ruby.setup',                          gr='mpKeywords' },

    -- rust keywords
    -- #############

    { id='cargo.offline_cmd',                   gr='mpKeywords' },
    { id='cargo.update',                        gr='mpKeywords' },
    { id='rust.upstream_deployment_target',     gr='mpKeywords' },
    { id='rust.upstream_archs',                 gr='mpKeywords' },
    { id='rust.use_cctools',                    gr='mpKeywords', ng='mpBool' },
    { id='rust.archiver',                       gr='mpKeywords' },
    { id='rust.ranlib',                         gr='mpKeywords' },
    { id='rust.rt_static_libs',                 gr='mpKeywords' },
    { id='rust.add_compiler_runtime',           gr='mpKeywords', ng='mpBool' },
    { id='configure.ld',                        gr='mpKeywords' },
    { id='rust.llvm.legacy',                        gr='mpKeywords' },
    { id='rust.llvm.cflags',                        gr='mpKeywords' },
    { id='rust.llvm.cxxflags',                        gr='mpKeywords' },
    { id='rust.llvm.ldflags',                        gr='mpKeywords' },

    -- select keywords
    -- ###############

    { id='select.group',                        gr='mpKeywords' },
    { id='select.file',                         gr='mpKeywords' },
    { id='select.entries',                      gr='mpKeywords' },

    -- sourcehut keywords
    -- ##################

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

    -- stub keywords
    -- #############

    { id='stub.subport_name',                   gr='mpKeywords' },
    { id='stub.lib_dep',                        gr='mpKeywords' },

    -- texlive keywords
    -- ################

    { id='texlive.mktexlsr',                    gr='mpKeywords' },
    { id='texlive.removedocdepends',            gr='mpKeywords' },
    { id='texlive.exclude',                     gr='mpKeywords' },
    { id='texlive.binaries',                    gr='mpKeywords' },
    { id='texlive.formats',                     gr='mpKeywords' },
    { id='texlive.languages',                   gr='mpKeywords' },
    { id='texlive.maps',                        gr='mpKeywords' },
    { id='texlive.forceupdatecnf',              gr='mpKeywords', ng='mpBool' },
    { id='texlive.use_mktexlsr',                gr='mpKeywords', ng='mpBool' },
    { id='texlive.use_mktexlsr_on_deactivate',  gr='mpKeywords', ng='mpBool' },
    { id='texlive.texmfport',                   gr='mpKeywords' },

    -- waf keywords
    -- ############

    { id='waf.python_branch',                   gr='mpKeywords' },
    { id='waf.python_version',                  gr='mpKeywords' },
    { id='waf.python',                          gr='mpKeywords' },

    -- wxWidgets keywords
    -- ##################

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
    -- ################

    { id='x11font.setup',                       gr='mpKeywords' },

    -- xcode keywords
    -- ##############

    { id='xcode.project',                       gr='mpKeywords' },
    { id='xcode.target',                        gr='mpKeywords' },
    { id='xcode.scheme',                        gr='mpKeywords' },
    { id='xcode.configuration',                 gr='mpKeywords' },
    { id='xcode.build.settings',                gr='mpKeywords' },
    { id='xcode.destroot.type',                 gr='mpKeywords' },
    { id='xcode.destroot.path',                 gr='mpKeywords' },
    { id='xcode.destroot.settings',             gr='mpKeywords' },

    -- xcode_workaround keywords
    -- #########################

    { id='xcode_workaround.type',               gr='mpKeywords' },
    { id='xcode_workaround.fixed_xcode_version',gr='mpKeywords' },
    { id='xcode_workaround.os_versions',        gr='mpKeywords' },

    -- xcodeversion keywords
    -- #####################

    { id='minimum_xcodeversions',               gr='mpKeywords' },

    -- xmlcatalog keywords
    -- ###################

    { id='xml.catalog',                         gr='mpKeywords' },
    { id='xml.addtocatalog',                    gr='mpKeywords' },
    { id='xml.entity',                          gr='mpKeywords' },
    { id='xml.rewrite',                         gr='mpKeywords' },
    { id='sgml.catalog',                        gr='mpKeywords' },
    { id='sgml.addtocatalog',                   gr='mpKeywords' }
}
