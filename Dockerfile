# using Ubuntu16
FROM ubuntu16
# Maintainer
MAINTAINER Mine
# riscv-gnu-toolchain env
ENV RISCV-GCC /opt/riscv/riscv-gnu-toolchain
# riscv-toolchain env
ENV RISCV /opt/riscv/riscv-tools
# install riscv-gnu-toolchain prerequisites
RUN sudo apt-get install autoconf /
                         automake /
                         autotools-dev /
                         curl /
                         libmpc-dev /
                         libmpfr-dev /
                         libgmp-dev /
                         gawk /
                         build-essential /
                         bison /
                         flex /
                         texinfo /
                         gperf /
                         libtool /
                         patchutils /
                         bc /
                         zlib1g-dev /
                         libexpat-dev
# get riscv-gnu-toolchain repo
RUN git clone --recursive https://github.com/riscv/riscv-gnu-toolchain && cd riscv-gnu-toolchain
# installation (Newlib)
RUN ./configure --prefix=$RISCV/newlib --enable-multilib && make
# installation (Newlib)
RUN ./configure --prefix=$RISCV/linux --enable-multilib && make linux
# add environment parmas
RUN export PATH=$RISCV/newlib/bin:$RISCV/linux/bin:$PATH && cd -

# install riscv-tools prerequisites
RUN sudo apt-get install autoconf /
                         automake /
                         autotools-dev /
                         curl libmpc-dev /
                         libmpfr-dev /
                         libgmp-dev /
                         libusb-1.0-0-dev /
                         gawk /
                         build-essential /
                         bison /
                         flex /
                         texinfo /
                         gperf /
                         libtool /
                         patchutils /
                         bc /
                         zlib1g-dev /
                         device-tree-compiler /
                         pkg-config /
                         libexpat-dev
# get riscv-tools repo
RUN git clone --recursive https://github.com/riscv/riscv-tools.git && cd riscv-tools
# install riscv-tools prerequisites
RUN ./build.sh
                         
