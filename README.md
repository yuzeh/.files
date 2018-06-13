# .files
This is my dotfiles directory. To install this:

    sudo apt-get install git curl vim-nox-py2 zsh tmux cmake build-essential
    sudo chsh -s /bin/zsh $USER
    # Log out and then log back in
    cd
    git clone https://github.com/yuzeh/.files.git
    .files/bootstrap.sh

You'll want to install the following before doing this:
- git
- curl
- vim
- zsh
- tmux
- cmake

The tmux bootstrap step may fail because of lack of permissions. Just edit the script locally before running the top-level bootstrap script.
