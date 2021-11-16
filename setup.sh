#!/bin/bash

package_exists () {
    local package_name=$1
    if which $package_name > /dev/null; then
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
        brew install $package_name
    else
        echo "$package_name already exists"
    fi
}

# Bootstrapper; install brew
if ! package_exists "brew"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "brew already installed"
fi

# Install brew packages
packages=(
    "asdf"
    "z"
    "trash"
)

for package in "${packages[@]}"
do
    install_package $package
done

# install oh-my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./zshrc ~./

# install all the fonts
curl https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip
