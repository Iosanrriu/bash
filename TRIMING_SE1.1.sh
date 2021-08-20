#!/bin/bash 
#Script Trimmomatic ejecution
trim="/mnt/c/Users/espin/Bio-WS/Trimmomatic-0.39"
ruta_raw="/mnt/c/Users/espin/Bio-WS/PROYECTS/HUMAN-COVID/1_RAW_fastq"
ruta_after_trim="/mnt/c/Users/espin/Bio-WS/PROYECTS/HUMAN-COVID/3_AFTER_TRIM"
SRA_in="$1".fastq #(con el .fastq en la carpeta Raw)
SRA_out="$1"_out.fastq
#PARA SE->>
export trim ruta_raw SRA_in SRA_out
time java -jar $trim/trimmomatic-0.39.jar SE -threads 4 -phred33 $ruta_raw/$SRA_in $ruta_after_trim/$SRA_out ILLUMINACLIP:/mnt/c/Users/espin/Bio-WS/Trimmomatic-0.39/TruSeq3-SE.fa:2:30:10 LEADING:5 TRAILING:5 SLIDINGWINDOW:4:30 MINLEN:30
