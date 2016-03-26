#!/bin/zsh

SOURCE_DIR=$(echo $PWD)
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  cd "${ZDOTDIT:-$HOME}/.zprezto"
  git pull && git submodule update --init --recursive
else
  git clone --recursive https://github.com/ahmedsoliman/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB

cd "$SOURCE_DIR"

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

## Vim Setup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s "$SOURCE_DIR/vim/vimrc" "${ZDOTDIR:-$HOME}/.vimrc"
ln -s "$SOURCE_DIR/vim/plugins.vim" "${ZDOTDIR:-$HOME}/.vim/plugins.vim"

## Tmux
ln -s "$SOURCE_DIR/tmux/tmux.conf" "${ZDOTDIR:-$HOME}/.tmux.conf"
