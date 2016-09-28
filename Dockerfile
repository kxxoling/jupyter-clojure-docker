FROM ubuntu:16.04
MAINTAINER Kane Blueriver <kxxoling@gmail.com>

ENV NOTEBOOK_PATH $HOME/notebooks
ENV PORT 8888
ENV CLOJUPYTER_PATH $HOME/clojupyter
ENV LEIN_ROOT=1

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xb8d7f7791716c8a4
RUN echo "deb http://ppa.launchpad.net/mikegedelman/leiningen-git-stable/ubuntu trusty main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/mikegedelman/leiningen-git-stable/ubuntu trusty main" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -yq python-setuptools \
        python-dev \
        build-essential \
        curl \
        default-jre \
        leiningen

RUN lein self-install

# Install Jupyter
RUN mkdir -p $NOTEBOOK_PATH
RUN easy_install pip
RUN pip install jupyter

# Install clpjupyter
RUN mkdir $CLOJUPYTER_PATH
COPY clojupyter $CLOJUPYTER_PATH
WORKDIR $CLOJUPYTER_PATH
RUN make
RUN make install

WORKDIR $NOTEBOOK_PATH
RUN rm -rf $CLOJUPYTER_PATH

EXPOSE $PORT
VOLUME $NOTEBOOK_PATH
CMD jupyter notebook --ip='*'

