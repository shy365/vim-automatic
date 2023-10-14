#!/bin/bash


function build_other()
{
  # 更新软件包列表
yes |sudo apt update
yes |sudo apt upgrade

# 安装 fcitx 输入法框架和搜狗拼音输入法
yes | sudo apt install language-pack-zh-hans
yes | sudo apt install fcitx fcitx-bin fcitx-table-all
yes | sudo apt install im-switch
yes | sudo apt install fcitx-sogoupinyin

# 安装 cscope 和 ctags
yes | sudo apt install cscope
yes | sudo apt install ctags


# 安装其他常用工具
yes | sudo apt install git
yes | sudo apt install curl
yes | sudo apt install htop
yes | sudo apt install vlc
yes | sudo apt-get install okular
yes | sudo apt-get install gparted
yes | sudo apt-get install cmake

# 使用 pip 安装 s-tui
yes | sudo pip3 install s-tui


}


function build_vim()
{

# 更新软件包列表
yes |sudo apt update
yes |sudo apt upgrade

# 添加 Jonathon F 的 Vim PPA，并安装 Vim
yes | sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
yes | sudo apt install vim
sudo apt-get install hunspell-en-gb hunspell-en-za hunspell-en-ca hunspell-en-au


# 安装node 和 yarn
tar -xvf node-v17.9.1-linux-x64.tar.xz
sudo mv node-v17.9.1-linux-x64 /usr/local/nodejs
sudo cd /usr/local/nodejs/bin
sudo ln -s /usr/local/nodejs/bin/npm /usr/local/bin
sudo ln -s /usr/local/nodejs/bin/node /usr/local/bin

mkdir -p ~/.vim
cp ./vim配置文件 ~/.vimrc

unzip vim插件.zip
cp ./vim/*  ~/.vim 

curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
sudo tar zvxf yarn-v1.22.19.tar.gz -C /opt

yarn_config_file="/etc/profile"  # Vim 配置文件路径

# 检查配置文件是否存在
if [ -f "$yarn_config_file" ]; then
    sudo rm yarn_config_file
    sudo cp ./profile /etc/profile
    sudo chmod 622
  echo "profile 已替换"

fi

vim_config_file="/etc/vim/vimrc"  # Vim 配置文件路径
# 检查配置文件是否存在
if [ -f "$vim_config_file" ]; then
    sudo rm vim_config_file
    sudo cp ./vimrc /etc/vim/
    sudo chmod 622
  echo "vimrc已替换"
fi



}

build_vim
build_other