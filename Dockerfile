FROM debian:8.8
ENV VER 8.0
ENV PASSWORD pass1234
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends sudo bzip2 wget octave scilab gnuplot
RUN adduser --quiet --shell /bin/bash --gecos "Sage user,101,," --disabled-password sage \
    && chown -R sage:sage /home/sage/ \
    && chown -R sage:sage /opt/ \
    && echo "sage ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER sage
RUN sudo apt-get -qq install -y --no-install-recommends \
    nano \
    curl \
    python \
    python-pip \
    libpython2.7 \
    gfortran \
    && sudo apt-get -y clean && sudo apt-get autoremove
WORKDIR /home/sage
RUN wget -q http://ftp.yz.yamagata-u.ac.jp/pub/math/sage/linux/64bit/sage-${VER}-Debian_GNU_Linux_8-x86_64.tar.bz2 \
    -O ./sage.tar.bz2 \
    && tar xjf ./sage.tar.bz2 --absolute-names
RUN rm -f ./sage.tar.bz2
COPY ./sagenb.sh ./
COPY ./jupyter.sh ./
RUN sudo ln -s /home/sage/SageMath/sage /usr/local/bin/ \
    && sudo chmod +x ./sagenb.sh \
    && sudo chmod +x ./jupyter.sh
COPY ./jupyter_notebook_config.py ./
RUN sage -pip install --upgrade pip && \
    sage -pip install octave_kernel scilab_kernel && \
    sage -python -m octave_kernel.install && \
    sage -python -m scilab_kernel.install && \
    mkdir /home/sage/jupyter
EXPOSE 8080 8888
ENTRYPOINT ["./sagenb.sh"]
