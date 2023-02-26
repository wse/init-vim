# init-vim
# neovim configuration file

mkdir -p $HOME/.config/nvim
ln -s ./init.vim ~/.config/nvim/

# Download the plugin installer 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Open nvim and run command
:PlugInstall


