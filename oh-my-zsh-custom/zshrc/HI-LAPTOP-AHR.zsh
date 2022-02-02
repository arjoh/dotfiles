plugins+=(
  ssh-agent
)
zstyle :omz:plugins:ssh-agent identities id_rsa

#SPACESHIP_DOCKER_SHOW=false

umask 022

path+=('/opt/mssql-tools/bin')

export LANG=en_US.UTF-8

sudo ip li set mtu 1200 dev eth0

function gateway() { ip route show default|awk '{print $3}' }
