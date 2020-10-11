#osx
plugins+=(
  osx
  macos-darkmode
)

MACOS_DARKMODE_ITERM_ENABLE="true"

#editors
plugins+=(
  sublime
  conda
  vscode
)

#python
plugins+=(
  python
  pip
  django
)

#node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#angular
plugins+=(
  ng
)

#various
plugins+=(
  exiftool
)

alias bundleid='/usr/libexec/PlistBuddy -c "Print CFBundleIdentifier"'

