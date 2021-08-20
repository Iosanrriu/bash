#!/bin/bash

ruta_raw="/mnt/c/Users/espin/Bio-WS/PROYECTS/HUMAN-COVID/1-RAW_fastq"
echo $file
time fastq-dump $file -O $ruta_raw
