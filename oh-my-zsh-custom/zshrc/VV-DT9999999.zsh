plugins+=(
  azure
  golang
  ssh-agent
  terraform
)
zstyle :omz:plugins:ssh-agent identities id_rsa

#SPACESHIP_DOCKER_SHOW=false

umask 022

path+=(
  '/opt/mssql-tools/bin'
  '/usr/local/go/bin'
)

export LANG=en_US.UTF-8
export EDITOR=vim

sudo ip li set mtu 1200 dev eth0

