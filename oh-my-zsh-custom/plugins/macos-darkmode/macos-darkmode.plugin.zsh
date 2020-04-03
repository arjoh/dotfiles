# Only run on macOS systems
if [[ "$(uname -s)" != "Darwin" ]]; then
    return 1
fi

# CONFIGURATION VARIABLES
: ${MACOS_DARKMODE_ITERM_ENABLE:=false}
: ${MACOS_DARKMODE_ITERM_LIGHT:=Default}
: ${MACOS_DARKMODE_ITERM_DARK:=Dark}
: ${MACOS_DARKMODE_VIM_ENABLE:=true}

function _darkmode_status() {
    local _ais
    _ais=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    MACOS_DARKMODE_STATUS=${_ais:=Light}
}

function _light() {
    MACOS_DARKMODE_STATUS=Light
    _darkmode_iTerm ${MACOS_DARKMODE_STATUS} "true"
}

function _dark() {
    MACOS_DARKMODE_STATUS=Dark
    _darkmode_iTerm ${MACOS_DARKMODE_STATUS} "true"
}

function _darkmode_iTerm() {
    local _mode=${1}
    local _force=${2}

    # If ITERM_PROFILE is not set or _ENABLE isn't set to "true", bail out.    
    [[ -z ${ITERM_PROFILE} ]] || \
    [[ "${MACOS_DARKMODE_ITERM_ENABLE}" != "true" ]] && return 1

    # If another ITERM_PROFILE was set, assume the user set it purposely and do nothing.
    # unless we're called manually.
    [[ "${ITERM_PROFILE}" != "${MACOS_DARKMODE_ITERM_DARK}" ]] && \
    [[ "${ITERM_PROFILE}" != "${MACOS_DARKMODE_ITERM_LIGHT}" ]] && \
    [[ "${_force}" != "true" ]] && return 1

    local _set

    [[ "${_mode}" == "Dark" ]] && _set=${MACOS_DARKMODE_ITERM_DARK}
    [[ -z ${_set} && "${_mode}" == "Light" ]] && _set=${MACOS_DARKMODE_ITERM_LIGHT}

    echo -ne "\033]50;SetProfile=${_set}\a"
    ITERM_PROFILE=${_set}
}

# Determine current mode
_darkmode_status
_darkmode_iTerm ${MACOS_DARKMODE_STATUS}

export MACOS_DARKMODE_STATUS

# ALIASES
alias light=_light
alias dark=_dark
