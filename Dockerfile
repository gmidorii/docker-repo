# OSはCentOS
FROM centos:latest

# 各パッケージをインストール
# pipやvirtualenvインストールも想定しています。
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install \
           kernel-devel \
           kernel-headers \
           gcc-c++ \
           patch \
           libyaml-devel \
           libffi-devel \
           autoconf \
           automake \
           make \
           libtool \
           bison \
           tk-devel \
           zip \
           wget \
           tar \
           gcc \
           zlib \
           zlib-devel \
           bzip2 \
           bzip2-devel \
           readline \
           readline-devel \
           sqlite \
           sqlite-devel \
           openssl \
           openssl-devel \
           git \
           gdbm-devel \
           python-devel \
           openssh-server

# Python3.5.2をインストール
# Python3.5.2をダウンロード
WORKDIR /root
RUN wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
RUN tar xzvf Python-3.5.2.tgz

# makeでインストール
WORKDIR ./Python-3.5.2
RUN ./configure --with-threads
RUN make install

# pipインストール(最新版)
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

# virtualenvインストール
RUN pip install virtualenv

# Djangoインストール
RUN pip install django

# bootstrap form
RUN pip install django-bootstrap-form

WORKDIR /opt
RUN git clone https://15adb179a4e8285d24d5273c2ea9c2c334c8ad29@github.com/tagasouichiro/apiclient.git

WORKDIR /opt/apiclient
RUN python3 manage.py migrate

CMD python3 /opt/apiclient/manage.py runserver 0.0.0.0:8888
