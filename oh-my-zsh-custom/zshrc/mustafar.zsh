plugins+=(
  platformio
  tmux
  ssh-agent
)
zstyle :omz:plugins:ssh-agent identities id_rsa

SPACESHIP_DOCKER_SHOW=false
PLATFORMIO_SETTING_PROJECTS_DIR=~/src/PlatformIO

umask 022
