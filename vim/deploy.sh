#!/bin/zsh
# deploy my vim config to another new OS

mkdir -p $HOME/.vim/{bundle,autoload}

#get pathogen
sudo apt-get -y install curl
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#get repo
for repo in `cat ./repos.txt`
do
    cd $HOME/.vim/bundle
    echo "clone repo, please wait..."
    git clone $repo
    cd -
    echo "clone ${repo} done!"
done

#whitespace is not a git repo
cp -r ./whitespace $HOME/.vim/bundle

#vimrc file
cp vimrc $HOME/.vimrc
cp gvimrc $HOME/.gvimrc
