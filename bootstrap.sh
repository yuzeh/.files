#!/usr/bin/env sh

die() {
  echo "${@}"
  exit 1
}

dot_files_dir=`dirname $0`

set -e

[ `pwd` = "$HOME" ] || die "Please run this script from your home directory!"

git submodule init
git submodule update

# Install OMZ
if ! [ -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  rm "${HOME}/.zshrc"
fi

for f in .zshrc .zshenv .vim .vimrc .tmux .tmux.conf; do
  [ -f $f ] || [ -d $f ] && die "Please remove ${f}!"
done

for f in .zshrc .zshenv .vim .tmux; do
  src="${dot_files_dir}/${f}"
  dst="${HOME}/${f}"
  ln -s $src $dst
  if [ -f "${dst}/bootstrap.sh" ]; then
    script="${dst}/bootstrap.sh"
    echo "Running ${script}..."
    $script
  fi
done
