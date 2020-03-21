# Only run on macOS systems
if [[ "$(uname -s)" != "Darwin" ]]; then
    exit 0;
fi

# CONFIGURATION VARIABLES
: ${OSX_DARKMODE_ITERM_ENABLE:=false}
: ${OSX_DARKMODE_ITERM_LIGHT:=Default}
: ${OSX_DARKMODE_ITERM_DARK:=Dark}
: ${OSX_DARKMODE_VIM_ENABLE:=true}

function _darkmode_status() {
    local _ais
    _ais=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    OSX_DARKMODE_STATUS=${_ais:=Light}
}

function _light() {
    OSX_DARKMODE_STATUS=Light
    _darkmode_iTerm ${OSX_DARKMODE_STATUS} "true"
}

function _dark() {
    OSX_DARKMODE_STATUS=Dark
    _darkmode_iTerm ${OSX_DARKMODE_STATUS} "true"
}

function _darkmode_iTerm() {
    local _mode=${1}
    local _force=${2}

    # If another ITERM_PROFILE was set, assume the user set it purposely and do nothing.
    [[  "${OSX_DARKMODE_ITERM_ENABLE}" != "true" && \
        "${_force}" == "true" || \
        -n ${ITERM_PROFILE} && \
         "${ITERM_PROFILE}" != "${OSX_DARKMODE_ITERM_DARK}" && \
         "${ITERM_PROFILE}" != "${OSX_DARKMODE_ITERM_LIGHT}" \
         ]]  && exit

    local _set

    [[ "${_mode}" == "Dark" ]] && _set=${OSX_DARKMODE_ITERM_DARK}
    [[ -z ${_set} && "${_mode}" == "Light" ]] && _set=${OSX_DARKMODE_ITERM_LIGHT}

    echo -ne "\033]50;SetProfile=${_set}\a"
    ITERM_PROFILE=${_set}
}

# Determine current mode
_darkmode_status
_darkmode_iTerm ${OSX_DARKMODE_STATUS}

export OSX_DARKMODE_STATUS

# ALIASES
alias light=_light
alias dark=_dark