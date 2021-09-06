#!/bin/bash


echo "Começo do teste de CPU!" 
sysbench --test=cpu --num-threads=4 --cpu-max-prime=9999 run


echo "Começo do teste Escrita" 

dd bs=16k count=102400 oflag=direct if=/dev/zero of=arquivo_teste

echo "Começo do teste Leitura" 

dd bs=16K count=102400 iflag=direct if=arquivo_teste of=/dev/null

echo "Começo do desempenho do HD" 

hdparm -t /dev/sda