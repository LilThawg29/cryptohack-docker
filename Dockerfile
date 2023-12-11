FROM sagemath/sagemath:latest

USER root

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends netcat tmux vim \
    && apt install -y libopenblas-dev libgmp-dev libmpfr-dev fplll-tools libfplll-dev libeigen3-dev build-essential git cmake \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/keeganryan/flatter.git \
    && cd flatter \ 
    && mkdir build && cd ./build \
    && cmake .. \
    && make \
    && make install \
    && ldconfig

RUN git clone https://github.com/josephsurin/lattice-based-cryptanalysis.git

USER sage

RUN sage -pip install --upgrade pip

RUN sage -pip install --no-cache-dir \
    pwntools \
    pyCryptoDome \
    z3-solver

WORKDIR lattice-based-cryptanalysis
RUN sudo sage -pip install .

RUN mkdir -p /home/sage/ctf-challenges
VOLUME [ "/home/sage/ctf-challenges" ]

COPY --chown=sage:sage custom.css /home/sage/.sage/jupyter-4.1/custom/custom.css

ENV PWNLIB_NOTERM=true

ENV BLUE='\033[0;34m'
ENV YELLOW='\033[1;33m'
ENV RED='\e[91m'
ENV NOCOLOR='\033[0m'

ENV BANNER=" \n\
${BLUE}----------------------------------${NOCOLOR} \n\
${YELLOW}CryptoHack Docker Container${NOCOLOR} \n\
\n\
${RED}After Jupyter starts, visit http://127.0.0.1:8888${NOCOLOR} \n\
${BLUE}----------------------------------${NOCOLOR} \n\
"

CMD ["echo -e $BANNER && cd /home/sage/ctf-challenges && sage -n jupyter --NotebookApp.token='' --no-browser --ip='0.0.0.0' --port=8888"]

