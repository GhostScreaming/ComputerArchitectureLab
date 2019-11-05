# using Ubuntu16
FROM ubuntu:16.04
# Maintainer
MAINTAINER Mine
# riscv-gnu-toolchain env
ENV RISCV-GCC /opt/riscv/riscv-gnu-toolchain
# riscv-toolchain env
ENV RISCV /opt/riscv/riscv-tools
# install riscv-gnu-toolchain prerequisites
# clone riscv-gnu-toolchain git repo
# install newlib gcc and linux gcc
# set gcc env
RUN apt-get update && \
    apt-get -y install git \
                       autoconf \
                       automake \
                       autotools-dev \
                       curl \
                       libmpc-dev \
                       libmpfr-dev \
                       libgmp-dev \
                       gawk \
                       build-essential \
                       bison \
                       flex \
                       texinfo \
                       gperf \
                       libtool \
                       patchutils \
                       bc \
                       zlib1g-dev \
                       libexpat-dev && \
    git clone --recursive https://github.com/riscv/riscv-gnu-toolchain && \
    cd riscv-gnu-toolchain && \
    ./configure --prefix=$RISCV-GCC/newlib --enable-multilib && make && \
    ./configure --prefix=$RISCV-GCC/linux --enable-multilib && make linux && \
    export PATH=$RISCV-GCC/newlib/bin:$RISCV-GCC/linux/bin:$PATH && cd -

# install riscv-tools prerequisites
# clone riscv-tools git repo
# install riscv-tools
# set riscv-tools env
RUN apt-get -y install autoconf \
                       automake \
                       autotools-dev \
                       curl \
                       libmpc-dev \
                       libmpfr-dev \
                       libgmp-dev \
                       libusb-1.0-0-dev \
                       gawk \
                       build-essential \
                       bison \
                       flex \
                       texinfo \
                       gperf \
                       libtool \
                       patchutils \
                       bc \
                       zlib1g-dev \
                       device-tree-compiler \
                       pkg-config \
                       libexpat-dev && \
    git clone --recursive https://github.com/riscv/riscv-tools.git && \
    cd riscv-tools && RUN ./build.sh && \
    export PATH=$RISCV/bin:$PATH && cd -
                         
