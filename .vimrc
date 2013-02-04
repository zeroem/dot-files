set nocompatible | filetype indent plugin on | syn on

let g:vim_addon_manager = {'scms': {'git': {}}}
fun! MyGitCheckout(repository, targetDir)
    let a:repository.url = substitute(a:repository.url, '^git://github', 'http://github', '')
    return vam#utils#RunShell('git clone --depth=1 $.url $p', a:repository, a:targetDir)
endfun

let g:vim_addon_manager.scms.git.clone=['MyGitCheckout']


fun SetupVAM()
    let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
    exec 'set rtp+='.vam_install_path.'/vim-addon-manager'
    " let g:vim_addon_manager = { your config here see "commented version" example and help
    if !isdirectory(vam_install_path.'/vim-addon-manager/autoload')
        execute '!git clone --depth=1 https://github.com/MarcWeber/vim-addon-manager.git '.shellescape(vam_install_path, 1).'/vim-addon-manager'
    endif
    call vam#ActivateAddons(['snipmate-snippets'], {'auto_install' : 0})
endfun
call SetupVAM()

set expandtab
set shiftwidth=4
set softtabstop=4
set ai
set nu

let g:snips_author = "Darrell Hamilton <darrell.noice@gmail.com>"
