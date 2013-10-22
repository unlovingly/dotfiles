# Initialize
```sh
$ git clone --recursive git://github.com/lovingly/dotfiles.git ~/.files
```

```sh
$ A=~/.files/submodules/auto-fu.zsh/auto-fu.zsh; (zsh -c "source $A ; auto-fu-zcompile $A ~/.zsh")
$ touch ~/.z
$ ln -s ~/.files/zsh.d/zshrc ~/.zshrc
$ ln -s ~/.files/zsh.d/zshenv ~/.zshenv
```

And start zsh. That's it.
