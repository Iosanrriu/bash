library(ggplot2)
library(DESeq2)
#from bash adquire the name of the data count

#1.1 Import & pre-process--------------------------
data=read.table(file = "SRR11517734Qnt.tsv", sep = '\t', header = TRUE)
data2=read.table(file = "SRR11517728Qnt.tsv", sep = '\t', header = TRUE)

#1.2 for control bond experiments count in a table
counts<-cbind(data[,c(1,4)],data2[,4])

head(counts)
colnames(counts)
names(counts)[names(counts) == "target_id"] <- "ensgene"
names(counts)[names(counts) == "est_counts"] <- "SRR11517734"
names(counts)[names(counts) == "data2[, 4]"] <- "SRR11517728"
colnames(counts)
head(counts)

metadata<-data.frame(id=c("SRR11517728","SRR11517734"),
                     dex=c("Healthy","Infected"),
                     celltype=c("Lung","Lung"),
                     geo_id=c("GSM4462413","GSM4462415"))

dds<-DESeqDataSetFromMatrix(countData=counts, 
                              colData=metadata, 
                              design=~dex, tidy = TRUE)