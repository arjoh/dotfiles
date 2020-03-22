set nu nowrap

call pathogen#infect()
syntax enable

" macos-darkmode
let macos_darkmode_status = $MACOS_DARKMODE_STATUS
if macos_darkmode_status == "Dark"
    set background=dark
elseif macos_darkmode_status == "Light"
    set background=light
endif

colorscheme solarized