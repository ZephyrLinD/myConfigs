#!/bin/bash
# auto config zsh
# author Zephyr

# 获取平台类型(mac/linux)
function get_platform_type()
{
    echo $(uname)
} 

# 获取linux平台
function get_linux_platform_type()
{
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    else
        echo "Unknow"
    fi
}

function install_on_linux()
{
    linux_type=`get_linux_platform_type`
    echo "Linux platform type: $linux_type"

    if [[ ${linux_type} == "Ubuntu" ]]; then
        install_on_ubuntu
    elif [[ ${linux_type} == "Deepin" ]]; then
        install_on_ubuntu
    elif [[ ${linux_type} == "LinuxMint" ]]; then
        install_on_ubuntu
    elif [[ ${linux_type} == "Debian" ]]; then
        install_on_debian
    elif [[ ${linux_type} == "CentOS" ]]; then
        install_on_centos
    elif [[ ${linux_type} == "openSUSE" ]]; then
        install__on_opensuse
    elif [[ ${linux_type} == "ArchLinux" ]]; then
        install_on_archlinux
    else
        echo "Not support linux type: "${type}
    fi
}

function install_on_ubuntu()
{
    sudo apt-get update
    sudo apt-get install curl zsh
    install_oh_my_zsh_and_plugins
}

function install_on_debian()
{
    sudo apt-get update
    sudo apt-get install curl zsh
    install_oh_my_zsh_and_plugins
}

function install_on_centos()
{
    sudo yum update
    sudo yum install curl zsh
    install_oh_my_zsh_and_plugins
}

function install_on_archlinux()
{
    sudo pacman -S zsh curl
    install_oh_my_zsh_and_plugins
}

function install_on_opensuse()
{
    sudo zypper install zsh curl
    install_oh_my_zsh_and_plugins
}

function install_oh_my_zsh_and_plugins()
{
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo '   _____          _               _________  _   _   '
    echo '  |__  /___ _ __ | |__  _   _ _ _|__  / ___|| | | |  '
    echo '    / // _ \ |_ \| |_ \| | | | |__|/ /\___ \| |_| |  '
    echo '   / /|  __/ |_) | | | | |_| | |  / /_ ___) |  _  |  '
    echo '  /____\___| .__/|_| |_|\__, |_| /____|____/|_| |_|  '
    echo '           |_|          |___/                        .......is now installed.'
    echo ''
    echo ''
    echo 'Just enjoy it!'
    echo 'p.s. Follow me at https://github.com/zephyrlind.'
    echo 'p.p.s You can copy the .zshrc now! Or add zsh-syntax-highlighting, zsh-autosuggestions into the .zshrc'
    printf "${normal}"
}

function main()
{
    type=`get_platform_type`
    echo "Platform type: "$type
    if [[ ${type} == "Darwin" ]]; then
        install_oh_my_zsh_and_plugin && print_logo
    elif [[ ${type} == "Linux" ]]; then
        install_on_linux
        print_logo
    else
        echo "Not Support"
    fi
    
}

# call
main



