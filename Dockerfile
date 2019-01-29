FROM ubuntu:16.04
LABEL maintainer="Aviator" \
      discord="Aviator#1024"

RUN apt-get update &&\
    apt-get install -y wget libboost-system1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 \
    libboost-thread1.58.0 libboost-chrono1.58.0 libevent-2.0-5 libevent-pthreads-2.0-5 &&\
    wget https://github.com/merge-swap/dvx-wallet/releases/download/v1.0.5.1/DVXcoind.zip -O /tmp/DVXcoind.tar.gz &&\
    tar -xvzf /tmp/DVXcoind.tar.gz -C /usr/local/bin &&\
    rm /usr/local/bin/DVXcoind-qt &&\ 
    rm /usr/local/bin/DVXcoind-tx && \
    apt-get purge -y wget  &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean &&\
    useradd -ms /bin/bash wallet

VOLUME ["/home/wallet/.DVXcoin"]
EXPOSE 17057/tcp 
USER wallet 
CMD DVXcoindd -printtoconsole