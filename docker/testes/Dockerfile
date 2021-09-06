FROM ubuntu

RUN apt update -y

RUN apt install -y sysbench

COPY ./testeCPU.sh /home

ENTRYPOINT [ "/bin/bash", "/home/testeCPU.sh" ]