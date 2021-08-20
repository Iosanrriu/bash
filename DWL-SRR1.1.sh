#!/bin/bash
ruta_destino=/mnt/c/Users/espin/Bio-WS/PROYECTS/HUMAN-COVID/1-RAW_.fastq
index="/mnt/c/Users/espin/Bio-WS/Reference_Genomes/homo_sapiens/transcripts.idx"
if [ -f $ruta_destino/$name ]
then
    echo "El archivo ya existe en la ruta "
else
    echo "se descargará el archivo $name en $ruta_destino"
    time fastq-dump $name -O $ruta_destino && echo "Su archivo de ha descargado exitosamente"  || echo "no se realizó la descarga"
#mensaje de descarga exitosa y tiempo de descarga real && solo si el primero es exitoso

#PARA PE->> 
time java -jar trimmomatic-0.39.jar PE -threads 3 -phred33 
$ruta_destino/$nameF $ruta_destino/$nameF $rutaSalida/SRR###_out_F.fastq $rutaSalida/SRR###_out_R.fastq
ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 LEADING:5 TRAILING:5 SLIDINGWINDOW:4:30 MINLEN:30


#-> PARA SE->> 
time java -jar trimmomatic-0.39.jar SE -threads 3 -phred33 
$rutaOrigenDelArchivo/SRR###.fastq $rutaSalida/SRR###_out.fastq 
ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 LEADING:5 TRAILING:5 SLIDINGWINDOW:4:30 MINLEN:30




time kallisto quant -i $index -o Quant1 --single -l 100 -s 20 SRR11517725_1_P.fastq 



time java -jar trimmomatic-0.39.jar SE -threads 3 -phred33 $ruta_destino/SRR11517734.fastq $ruta_salida/SRR11517734_out.fastq ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 LEADING:5 TRAILING:5 SLIDINGWINDOW:4:30 MINLEN:30