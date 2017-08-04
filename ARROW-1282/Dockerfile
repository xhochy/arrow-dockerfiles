FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y gcc-4.9 g++-4.9 build-essential gdb wget git
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /root/miniconda3
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN conda update -y -q conda
RUN conda config --set auto_update_conda false
RUN conda config --add channels https://repo.continuum.io/pkgs/free
RUN conda config --add channels conda-forge
ENV CC=gcc-4.9
ENV CXX=g++-4.9
RUN conda create -y -q -n pyarrow-dev \
      python=3.6 numpy six setuptools cython pandas pytest \
      cmake flatbuffers rapidjson boost-cpp thrift-cpp snappy zlib \
      brotli jemalloc lz4-c zstd -c conda-forge
