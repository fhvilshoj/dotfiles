This repo contains all the relevant apps, brew installs, dotfiles, etc.

To get the setup done:

1. Install `xcode` via the App store
2. Install [xTerm2](https://iterm2.com/)
3. Set up shell

```
# xcode stuff
sudo xcodebuild -license accept
xcode-select --install

# Set up color scheme (I chose 116 / Dracula)
bash -c  "$(curl -sLo- https://git.io/vQgMr)"

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install essentials from brew
brew install stow
brew install tmux
brew install neovim
brew install fzf
brew install ripgrep
brew install lazygit
brew install autojump  # there's a little script you need to run. pay attention to the output.
brew install bat
brew install fd
brew install nvm
brew install nnn
brew install font-hack-nerd-font
brew install 1password-cli
brew install --cask amethyst
brew install tree
brew install imagemagick
brew install libsixel
```

> [!TIP] 
> If you want things to look nice, consider installing [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)
> 
> `git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10kdd`


To make the configurations from this dotfile repository work, use the following commands:

```
# This creates needed symlinks to configure applications
git clone https://github.com/fhvilshoj/dotfiles .dotfiles
cd .dotfiles
stow nnn
stow zsh
stow nvim
stow tmux
stow ipython
```

4. Install [Raycast](https://www.raycast.com)
    * I've dropped `hammerspoon` and use Raycast to configure jumping between applications instead.


## Neovim

* Use `lazy.nvim` as package manager.
* The `telekasten` package requires a subdirectory in `~/Documents` for zettle notes.

## tmux

To make tmux work properly, make sure to follow these steps.

1. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
2. `C-a :source-file ~/.tmux.conf` will make tmux load the plugin manager.
3. `C-a I` will install the tmux plugins.

## Amethyst

I made no significant changes to the configuration. 

* I use layouts `["Tall", "Fullscreen", "Tall Right"]` 
* I configured the "Select Fullscreen layout" shortcut to `<meta+shift>B`


