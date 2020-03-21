set nu nowrap

call pathogen#infect()
syntax enable

let osx_darkmode_status = $OSX_DARKMODE_STATUS
if osx_darkmode_status == "Dark"
    set background=dark
elseif osx_darkmode_status == "Light"
    set background=light
endif
