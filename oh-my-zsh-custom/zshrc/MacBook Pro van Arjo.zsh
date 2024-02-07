#osx
plugins+=(
  macos
#  macos-darkmode
)

MACOS_DARKMODE_ITERM_ENABLE="true"

#various
plugins+=(
  exiftool
)

alias bundleid='/usr/libexec/PlistBuddy -c "Print CFBundleIdentifier"'

export LC_ALL="en_US.UTF-8"

