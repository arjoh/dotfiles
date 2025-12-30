#osx
plugins+=(
  macos
#  macos-darkmode
  platformio
#  ssh-agent
)
zstyle :omz:plugins:ssh-agent identities id_rsa

MACOS_DARKMODE_ITERM_ENABLE="true"

#various
plugins+=(
  gh
  exiftool
)

alias bundleid='/usr/libexec/PlistBuddy -c "Print CFBundleIdentifier"'

export LC_ALL="en_US.UTF-8"

