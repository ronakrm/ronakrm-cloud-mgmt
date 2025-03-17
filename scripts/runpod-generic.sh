apt-get update && apt-get install -y vim rsync htop screen curl git build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev libncurses-dev tk-dev tmux

apt-get install locales

locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -

curl -LsSf https://astral.sh/uv/install.sh | sh
. /root/.rye/env

# git setup
sh /workspace/ronakrm-cloud-mgmt/scripts/runpod-git.sh

# hf cache, path dirs
. /workspace/ronakrm-cloud-mgmt/scripts/env-vars.sh
