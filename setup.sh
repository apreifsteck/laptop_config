#!/bin/bash

# -e: will raise an exception on error
# -u: will not allow undefined variables
# -o pipefail: if something fails in a pipeline that will be the return code for the whole pipeline
set -euo pipefail
# Something to do with how bash separates words
IFS=$'\n\t'


program_in_path () {
    local prog_name=$1
    if which $prog_name > /dev/null; then
        # echo "package $prog_name exists"
        return 0
    else
        # echo "package $prog_name does not exist"
        return 1
    fi
}

package_exists () {
    local package_name=$1
    if brew list | grep -w $package_name > /dev/null; then
        # echo "package $package_name exists"
        return 0
    else
        # echo "package $package_name does not exist"
        return 1
    fi
}

install_package() {
    local package_name=$1
    if ! package_exists $package_name; then
        echo "installing package $package_name"
        brew install $package_name
    else
        echo "$package_name already exists"
    fi
}

# Bootstrapper; install brew
if ! program_in_path "brew"; then
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "brew already installed"
fi

# Install brew packages
packages=(
    "asdf"
    "z"
    "trash"
    "pure"
    "neovim"
    "postgresql"
    "ripgrep"
    "fswatch"
    "fish"
)

for package in "${packages[@]}"
do
    install_package $package
done

echo "installing kitty terminal"
if ! program_in_path "kitty"; then
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
	echo "kitty already installed"
fi

# install oh-my zsh
echo "installing oh-my zsh"
if [ -z $ZSH ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "ZSH already installed"
fi

echo "linking .zshrc"
set +e
if ! ln .zshrc ~/; then
	echo "Could not link zsh because it is already linked or present in home dir"
fi
set -e


# install Fira Code Fonts
echo "installing fonts"
fonts_dir="fonts"
version=5.2
zip=Fira_Code_v${version}.zip
curl --fail --location --show-error https://github.com/tonsky/FiraCode/releases/download/${version}/${zip} --output ${zip}
unzip -o -q -d ${fonts_dir} ${zip}
rm ${zip}
cp $fonts_dir/ttf/* ~/Library/Fonts/
rm -rf $fonts_dir 

# install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

prog_name="pip3"
if ! program_in_path $prog_name; then
    echo "installing python before attempting to install pygments"
else
    pip3 install pygments
fi



