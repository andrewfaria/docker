FROM ubuntu-dev

RUN apt-get install -y vim

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    printf "execute pathogen#infect() \n syntax on \n filetype plugin indent on \n" >> ~/.vimrc

RUN printf "set autoindent \n set expandtab \n set shiftwidth=2 \n set softtabstop=2 \n set tabstop=2 \n" >> ~/.vimrc

RUN cd ~/.vim/bundle && \
    git clone git://github.com/tpope/vim-sensible.git

RUN cd ~/.vim/bundle && \
    git clone git://github.com/digitaltoad/vim-jade.git
