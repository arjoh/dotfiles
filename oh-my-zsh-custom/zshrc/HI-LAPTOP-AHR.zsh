plugins+=(
  ssh-agent
)
zstyle :omz:plugins:ssh-agent identities id_rsa

SPACESHIP_DOCKER_SHOW=false

umask 022

path+=('/opt/mssql-tools/bin')
