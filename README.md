This repo contains all the relevant apps, brew installs, dotfiles, etc.

To get the setup done:

0. Install [iterm2](https://iterm2.com/) and [oh-my-zsh](https://ohmyz.sh/#install)
1. `git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10kdd`

```
xcode-select --install
sudo xcodebuild -license accept
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/fhvilshoj/dotfiles .dotfiles
cd .dotfiles

# Install all the brew stuff and appstore apps.
brew update
brew bundle cleanup --force
brew upgrade
brew bundle check || brew bundle install
```

## Neovim

1. Packer or lazy.nvim
2. Use mason to install all the formatters, linters, ets.
   ✓ pyright
   ✓ prettier
   ✓ black
   ✓ isort
   ✓ lua-language-server
   ✓ stylua
3. Install NNN

## ZSH
