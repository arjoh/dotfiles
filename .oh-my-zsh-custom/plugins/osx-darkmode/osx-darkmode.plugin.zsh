# Only run on macOS systems
if [[ "$(uname -s)" != "Darwin" ]]; then
	exit 0;
fi

# ALIASES

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

function _darkmode_iTerm() {

	# If another ITERM_PROFILE was set, assume the user set it purposely and do nothing.
	[[ -n ${ITERM_PROFILE} && \
         "${ITERM_PROFILE}" != "${OSX_DARKMODE_ITERM_DARK}" && \
         "${ITERM_PROFILE}" != "${OSX_DARKMODE_ITERM_LIGHT}" ]] \
         && exit

	local _mode=${1}
	local _set

    [[ "${_mode}" == "Dark" ]] && _set=${OSX_DARKMODE_ITERM_DARK}
    [[ -z ${_set} && "${_mode}" == "Light" ]] && _set=${OSX_DARKMODE_ITERM_LIGHT}

    echo -ne "\033]50;SetProfile=${_set}\a"
    ITERM_PROFILE=${_set}
}

# Determin current mode
_darkmode_status

if [[ "${OSX_DARKMODE_ITERM_ENABLE}" == "true" ]]; then
	_darkmode_iTerm ${OSX_DARKMODE_STATUS}
fi
