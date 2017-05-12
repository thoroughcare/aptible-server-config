# For easier working with aptible ssh rails console
apt-get install vim -y
apt-get install tmux -y
apt-get install less -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors/
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O ~/.vim/colors/molokai.vim
wget https://raw.githubusercontent.com/thoroughcare/aptible-server-config/master/vimrc -O ~/.vimrc
# install vim plugins before patching ruby syntax
#vim --cmd '' \
# -c 'PluginInstall' \
# -c 'qa!'
# patched syntax file for vim 7.3 on old linux for server
wget https://gist.githubusercontent.com/lacostenycoder/cbc380ec7597abf264ff7b79e042f159/raw/049c9f37fdfc9c342045be677289756fc02e9b1d/ruby.vim -O ~/.vim/bundle/vim-ruby/syntax/ruby.vim
echo "To install vim pluggins launch vim and type :PlugginInstall"
