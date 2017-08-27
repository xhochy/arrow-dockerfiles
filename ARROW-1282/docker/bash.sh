#!/bin/bash

docker run --rm -ti --cap-add=SYS_PTRACE -v $PWD:/io arrow_1282 /io/docker/_docker_bash.sh
