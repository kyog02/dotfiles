#!/bin/bash

#元はHOMEディレクトリにあるdotfileにシンボリックリンクを設定
 DOT_FILES=(.bashrc .bash_profile .vimrc )

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

#gtagsは元はglobalディレクトリに存在していたため、当箇所にシンボリックリンクを設定
 gtags=gtags.conf
 ln -s $HOME/dotfiles/$gtags $HOME/global



