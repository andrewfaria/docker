# VIM with YouCompleteMe JavaScript autocomplete

![](https://github.com/andrewfaria/docker/blob/master/media/js-autocomplete-vim.png)

## Plugins
```vim
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'digitaltoad/vim-jade'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'ahayman/vim-nodejs-complete'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
```

## Install and Use
1. clone this repo
2. `cd dev-vim`
3. `docker build -t dev-vim .`
4. `docker run -it --rm --volumes-from <your-app-container> dev-vim`
