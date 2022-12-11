```zsh install
sudo apt install zsh
chsh -s $(which zsh)
```
```git
ssh-keygen -t rsa
cat id_rsa.pub | clip.exe
git config --global -l
git config --global core.autocrlf false
```
```neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
```
```nodenv
curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash
sudo apt-get install language-pack-ja
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(nodenv init -)"' >> ~/.zshrc
https://nodejs.org/ja/
```
