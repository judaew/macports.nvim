" Misc
syn region   mpBool            matchgroup=Normal start="" skip="\\$" end="$" contained contains=mpBoolKeywords
syn keyword  mpBoolKeywords    yes no contained
syn match    mpNumber          "\<\d\+\(\(\.\|-\|_\)\d\+\)*\>"
syn match    mpVariable        "${[^}]*}"
syn match    mpVariable        "{\*}"
syn region   mpString          start=+"+ end=+\("$\|"\s\)+ oneline contains=mpVariable
" syn region   mpString          start=+".*\\$+ end=+\("$\|"\s\)+ contains=mpVariable
syn region   mpStringNotes     start=+\s\("\|{\)$+ end=+\(^"\|\s\+"\|^}\|\s\+}\)$+ skip="$" contained contains=mpVariable
syn region   mpComment         start="^\s*\#" skip="\\$" end="$"
syn region   mpPortGroup       matchgroup=Normal start="" end="$" contained contains=mpPortGroupName,mpNumber
syn match    mpURL             "\<\w\+\>:\S\+" contained contains=mpVariable
syn region   mpCategories      matchgroup=Normal start="" skip="\\$" end="$" contained contains=mpCategoriesName
syn region   mpDescription     matchgroup=Normal start="" skip="\\$" end="$" contained contains=mpVariable
syn region   mpConfEntries     matchgroup=Normal start="" skip="\\$" end="$" contained contains=mpVariable
syn region   mpSupportedArchs  matchgroup=Normal start="" end="$" contained contains=mpPlatformArch
syn region   mpBlock           start="\s{$" skip="$" end="^\(\s*\|\)\}$" contained
      \ contains=mpKeywords,mpTcl,mpVariable,mpString,mpComment

" Phases
syn region   mpPhaseBlock      start="\s{$" skip="$" end="^\(\s*\|\)\}$" contained
      \ contains=mpTcl,mpVariable,mpString,mpComment

" Checksums
syn region   mpChecksums       matchgroup=Normal start="" skip="\\$" end="$" contained contains=mpVariable,mpChecksumsType

" Variants
" TODO: Add "mpBlock" group
syn region   mpVariant         matchgroup=Keyword start="^\s*\zsvariant" skip="\\$" end="$" 
      \ contains=mpVariantName,mpVariantRequires,mpVariantDescription,mpVariantConflicts skipwhite
syn match    mpVariantName     "\<\w\+\>" contained
syn match    mpDefaultVariants "[+-]\<\w\+\%(\s\+[+-]\w\+\)*\>" contained

" Platform
" TODO: Add "mpBlock" group
sy region   mpPlatform         matchgroup=Keyword start="^\s*\platform\s" end="$"
      \ contains=mpPlatformName,mpPlatformVersion,mpPlatformArch
sy region   mpPlatforms        matchgroup=Keyword start="^\s*\platforms\s" end="$" contains=mpPlatformName
sy match    mpPlatformVersion  "\<\d\+\>" contained skipwhite

" Subport
sy region   mpSubport          matchgroup=Keyword start="^\s*\zssubport\>" skip="\\$" end="$" contains=mpSubportName
sy match    mpSubportName      "\<\w\+\(-\w\+\|\)\>" contained nextgroup=mpBlock skipwhite
syn region  mpSubportBlock     start="\s{$" skip="$" end="^\(\s*\|\)\}$" contained
      \ contains=mpKeywords,mpTcl,mpVariable,mpString

" Dependencies
sy region   mpDependsEntries   matchgroup=Normal start="" skip="\\$" end="$" contains=mpDependsEntry contained
sy match    mpDependsEntry     "\<\%(port\|bin\|path\|lib\):" contained
