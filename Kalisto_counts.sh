#!/bin/bash
#Script Kallisto ejecution
#definit ruta de fastcq after trimmomatic
ruta_after_trim="/mnt/c/Users/espin/Bio-WS/PROYECTS/HUMAN-COVID/3_AFTER_TRIM";
#ruta donde se almacenaran los outputs de kallisto
ruta_kal_count="/mnt/c/Users/espin/Bio-WS/PROYECTS/HUMAN-COVID/5_KALLISTO_COUNTS";
#ruta al archivo de index
index="/mnt/c/Users/espin/Bio-WS/Reference_Genomes/homo_sapiens/transcripts.idx";
#el primer argumento despues de kalisto_counts.sh el_archivo.fasta
file_name="$1";
Fold_name="$1"_Quant;

time kallisto quant -i $index -t 6 -o $ruta_kal_count/$Fold_name --single -l 100 -s 20 $ruta_after_trim/"$file_name"_out.fastq
