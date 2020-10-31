# .vim
My vim configuration.

## Installation
#### Install MacVim (recommended)
1. Download and install MacVim from https://github.com/macvim-dev/macvim
2. Create command line launcher
```If 
$ ln -s /Applications/MacVim.app/Contents/bin/mvim /usr/local/bin/mvim
```
3. Add `/usr/local/bin` in your $PATH by adding the following to your shell profile (`.zshrc`, `.bash_profile`)
```
$ export PATH="/usr/local/bin:${PATH}"
```

#### Install xliiauo/.vim
```
$ git clone git@github.com:xliiauo/.vim.git
$ ln -s .vim/vimrc .vimrc
```

#### Install Vim Plugins
Install plugins after openning vim for the first time.
```
:PlugInstall
```

## Common issues
#### [coc.nvim] "node" is not executable, checkout https://nodejs.org/en/download/, Press ENTER or type command to continue.
Install node.js will solve the issue, you can do that through homebrew.
```
$ brew install node
```

#### Error detected while processing /******/. for "*"..script /Users/******/.vim/plugged/ultisnips/autoload/UltiSnips.vim, E370: Could not load library /usr/local/Frameworks/Python.framework/Versions/3.8/Python
Python3 support is missing for the vim you are using. Check if you have Python3 support with the following, you should see `+python3` in the list:
```
$ vim --version
```

If Python3 support is not enabled, the easiest way to add is to reinstall vim with homebrew with the following:
```
$ brew install vim
```

It is also useful to make sure that you are using the homebrew vim instead of system vim:
```
$ which vim
/usr/local/bin/vim
```

Make sure to change git vim to the homebrew vim as well:
```
git config --global core.editor "/usr/local/bin/vim"
```

