#!/bin/bash

#注意：複数回setup.shを実行すると、.vimや.atomといったディレクトリ内にもシンボリックリンクが作成されてしまう
#元々HOMEディレクトリにあるdotfileにシンボリックリンクを設定
 DOT_FILES=(.bashrc .bash_profile .vimrc .vim .tmux.conf .atom .gitconfig .gitignore)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

#gtagsは元はglobalディレクトリに存在していたため、当箇所にシンボリックリンクを設定
 gtags=gtags.conf
 ln -s $HOME/dotfiles/$gtags $HOME/global/$gtags



