# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gnustep-make \
    gobjc \
    libgnustep-base-dev \
    libgnustep-gui-dev \
    libmemcached-dev \
    libssl-dev \
    libcairo2-dev \
    libldap2-dev \
    zlib1g-dev \
    libmysqlclient-dev \
    memcached \
    libxslt1-dev \
    libwbxml2-dev \
    libmemcached-dev \
    libmemcachedutil2 \
    libxml2-dev \
    openssl \
    build-essential \
    libssl-dev \
    libxslt1-dev \
    wget \
    libexpat1-dev \
    libmariadb-dev \
    libgsasl7-dev \
    libkolabxml1-dev \
    libawl-dev \
    dpkg-dev \
    gcc \
    gnutls-bin \
    libcurl4-gnutls-dev \
    libgnutls28-dev \
    libmysqlclient-dev \
    libpq-dev \
    libssl-dev \
    libldap2-dev \
    libmemcached-dev \
    libxml2-dev \
    libxapian-dev \
    automake \
    make \
    libtool \
    subversion \
    gperf \
    git \
    postgresql-server-dev-all \
    postgresql-server-dev-9.5 \
    libxslt1-dev \
    libunwind8 \
    libunwind-dev \
    openjdk-11-jdk \
    nano \
    software-properties-common \
    && apt-get clean

# Install SOGo from source
RUN cd /usr/src && \
    git clone https://github.com/inverse-inc/sogo.git && \
    cd sogo && \
    ./configure --without-gnustep --without-memcached && \
    make && \
    make install

# Expose ports
EXPOSE 80 443

# Start SOGo service
CMD ["sogod"]
