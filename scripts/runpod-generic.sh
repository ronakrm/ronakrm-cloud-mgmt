apt-get update && apt-get install -y vim rsync htop screen curl git build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev libncurses-dev tk-dev tmux

apt-get install locales

locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

. "$HOME/.asdf/asdf.sh"
echo '. $HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

asdf plugin add python
asdf plugin add poetry

asdf install python 3.11.3
asdf install python 3.12.4

asdf global python 3.11.3

curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
. /root/.rye/env


# git setup
sh /workspace/ronakrm-cloud-mgmt/scripts/runpod-git.sh

# hf cache, path dirs
. /workspace/ronakrm-cloud-mgmt/scripts/env-vars.sh
