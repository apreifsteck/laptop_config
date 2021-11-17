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
        echo "installing package $package_name"
        brew install $package_name
    else
        echo "$package_name already exists"
    fi
}

# Bootstrapper; install brew
if ! package_exists "brew"; then
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
)

for package in "${packages[@]}"
do
    install_package $package
done

# install oh-my zsh
echo "installing oh-my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./zshrc ~./

# install Fira Code Fonts
echo "installing fonts"
fonts_loc="fonts.zip"
curl -o $fonts_loc https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip
fonts_out="fonts"
unzip $fonts_loc -d $fonts_out
cp $fonts_out/ttf/* ~/Library/Fonts/
rm -rf $fonts_loc $fonts_out

# install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo "downloading snazzy theme for iterm2"
echo "double click it in finder to install I guess"
curl -o snazzy_theme.itermcolors https://github.com/sindresorhus/iterm2-snazzy/raw/main/Snazzy.itermcolors

# install some plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

package_name="pip3"
if ! package_exists $package_name; then
    echo "installing python before attempting to install pygments"
else
    pip3 install pygments
fi

source ~/.zshrc

