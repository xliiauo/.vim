# .vim
My vim configuration.

## Installation
#### Install MacVim (recommended)
1. Download and install MacVim from https://github.com/macvim-dev/macvim
2. Create command line launcher
```
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
#### 1. [coc.nvim] "node" is not executable, checkout https://nodejs.org/en/download/, Press ENTER or type command to continue.
Install node.js will solve the issue, you can do that through homebrew.
```
$ brew install node
```
