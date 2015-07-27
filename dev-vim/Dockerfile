FROM ubuntu:14.04

RUN apt-get update \
    && apt-get -y install \
    curl \
    git \
    wget \
    nodejs \
    npm \
    vim \
    python \
    python-dev \
    build-essential \
    cmake

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle \
    && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN cd ~/.vim/bundle \
    && git clone https://github.com/Valloric/YouCompleteMe.git \
    && cd YouCompleteMe \
    && git submodule update --init --recursive

RUN mkdir ~/ycm_build \
    && cd ~/ycm_build \
    && cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp \
    && make -j 4 ycm_support_libs

RUN cd ~/.vim/bundle \
    && git clone https://github.com/marijnh/tern_for_vim.git \
    && cd tern_for_vim \
    && npm install

COPY .vimrc /root/.vimrc

RUN sed -i 's/\r$//' /root/.vimrc

RUN vim -E -u NONE -S ~/.vimrc +PluginInstall +qall > /dev/null; exit 0

VOLUME /root

CMD ["bash"]
