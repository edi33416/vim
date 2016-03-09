Vim
===

This is my personal Vim configuration (.vimrc) file.
It lists a set of plugins that I find helpful and bindings that help me use this plugins with ease.
This file is a collection of settings that I have found on the web or in other public .vimrc files (I wrote the owners).

Here is one way of how you can use my .vimrc file.

I order to make use of it, you will need to install (if you haven't already) [Vundle](https://github.com/VundleVim/Vundle.vim), a Vim plugin manager.
Follow [this](https://github.com/VundleVim/Vundle.vim#quick-start) quick start guide to install [Vundle](https://github.com/VundleVim/Vundle.vim).

After you have installed [Vundle](https://github.com/VundleVim/Vundle.vim), open a terminal window and [`git clone`](http://gitref.org/creating/#clone) [this](https://github.com/edi33416/vim) repo.

```
$ mkdir -p ~/workspace/vimrc
$ git clone https://github.com/edi33416/vim.git ~/workspace/vimrc
```

Make a backup of your .vimrc file (if you have one) and then override it.

```
$ cp ~/.vimrc ~/.vimrc_bak
$ mv ~/workspace/vimrc/vimrc ~/.vimrc
```

Now open __Vim__ and install the plugins listed in the .vimrc file by typing `:VundleInstall`.
This will download and install the plugins into your `~/.vim/bundle/` folder.

One of the downloaded plugins, and one of my favorites, is [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), a fast, as-you-type, fuzzy-search code completion engine for Vim. I encourage you to use it and to find out more about it from [here](https://github.com/Valloric/YouCompleteMe). Installing [YCM](https://github.com/Valloric/YouCompleteMe) will require a few more steps, listed [here](https://github.com/Valloric/YouCompleteMe#installation).

Enjoy and happy coding.
