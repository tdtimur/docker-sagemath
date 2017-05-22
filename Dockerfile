FROM debian:8.8
ENV VER 7.6
RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo bzip2 wget
RUN adduser --quiet --shell /bin/bash --gecos "Sage user,101,," --disabled-password sage \
    && chown -R sage:sage /home/sage/ \
    && echo "sage ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER sage
RUN sudo apt-get install -y --no-install-recommends \
    nano \
    curl \
    python \
    python-pip \
    libpython2.7 \
    gfortran
WORKDIR /home/sage
RUN wget http://ftp.yz.yamagata-u.ac.jp/pub/math/sage/linux/64bit/sage-${VER}-Debian_GNU_Linux_8-x86_64.tar.bz2 -O ./sage.tar.bz2 \
    && tar xvjf ./sage.tar.bz2 \
    && mv ./SageMath ./sagemath \
    && rm -f ./sage.tar.bz2
COPY ./sagenb.sh ./
COPY ./jupyter.sh ./
RUN sudo ln -s /home/sage/sagemath/sage /usr/local/bin/ \
    && sudo chmod +x ./sagenb.sh \
    && sudo chmod +x ./jupyter.sh
EXPOSE 8080 8888
ENTRYPOINT ["./sagenb.sh"]
