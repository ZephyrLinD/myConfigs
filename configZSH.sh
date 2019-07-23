#!/bin/bash
# auto config zsh
# author Zephyr

# 获取平台类型(mac/linux)
function get_platform_type()
{
    echo $(uname)
} 

# 获取linux平台类型，Debian系列还是RedHat系列或者其他
function get_linux_platform_type()
{
    if which apt-get > /dev/null ; then
        echo "Debian etc...(Ubuntu/Debian/Deepin etc)"
    elif which yum > /dev/null ; then
        echo "RedHat etc...(Fedora/RHEL/CentOS)"
    elif which pacman > /dev/null ; then
        echo "ArchLinux"
    else
        echo "invalid"
    fi
}

function install_on_linux()
{
    type=`get_linux_platform_type`
    echo "Linux platform type: $type"
    if [ "$type" -eq "Debian etc...(Ubuntu/Debian/Deepin etc)"] ; then
        sudo apt-get install zsh curl
    elif [ "$type" -eq "RedHat etc...(Fedora/RHEL/CentOS)" ] ; then
        sudo yum install zsh curl
    elif [ "$type" -eq "ArchLinux" ]
    install_oh_my_zsh_and_plugins
}

function install_oh_my_zsh_and_plugins()
{
    fork sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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
    echo 'p.s. Follow me at https://github.com/chxuan.'
    echo 'p.p.s You can copy the .zshrc now!'
    printf "${normal}"
}

function main()
{
    type = `get_platform_type`
    echo "Platform type: $type"
    if [ "$type" -eq "DarWin"] ; then
        install_oh_my_zsh_and_plugin
    elif [ "$typr" -eq "Linux"] ; then
        install_on_linux
    else
        echo "Not Support"
    fi
    print_logo
}

# call
main



