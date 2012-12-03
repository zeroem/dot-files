set nocompatible | filetype indent plugin on | syn on

fun SetupVAM()
    let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
    exec 'set rtp+='.vam_install_path.'/vim-addon-manager'
    " let g:vim_addon_manager = { your config here see "commented version" example and help
    if !isdirectory(vam_install_path.'/vim-addon-manager/autoload')
        execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(vam_install_path, 1).'/vim-addon-manager'
    endif
    call vam#ActivateAddons(['snipmate-snippets'], {'auto_install' : 0})
endfun
call SetupVAM()

set expandtab
set shiftwidth=4
set softtabstop=4

set ai
set nu
