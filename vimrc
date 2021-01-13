set nu nowrap

call pathogen#infect()
syntax enable

" macos-darkmode
let macos_darkmode_status = $MACOS_DARKMODE_STATUS
if macos_darkmode_status == "Light"
    set background=light
else
    set background=dark
endif
call togglebg#map("<F5>")

colorscheme solarized
