setwd("/data/users/npervola/Summary_annotation_practice/data/raw")
library(ggplot2)

r6_gtf<-read.table("r6_gtf.txt",sep="\t")
exon_length<-read.table("exon_length.txt",sep="\t")
gene_length<-read.table("gene_length.txt",sep="\t")
transcript_counts<-read.table("transcript_counts.txt",sep="")
#Total number of features of each type, sorted from the most common to the least common
colnames(r6_gtf)<-c("Chr","Source","Feature","Start","End","Score","V7","V8","V9")
table1<-apply(X = r6_gtf[,c('Chr','Feature')], MARGIN = 2, FUN = table)
sort(table1[[2]],decreasing=T)

#Total number of genes per chromosome, sorted from most to least
genes_only<-grep("gene",r6_gtf[,3])
genes_only_table<-r6_gtf[genes_only,]
table2<-apply(X = genes_only_table[,c('Chr','Feature')], MARGIN = 2, FUN = table)
sort(table2[[1]],decreasing=T)

#Histogram of transcripts per gene
p = ggplot(aes(x=V1),data=transcript_counts)
p+geom_histogram()

#histogram of exon length
q = ggplot(aes(x=V1),data=exon_length)
q+geom_histogram()

#Histogram of gene length
r = ggplot(aes(x=V1),data=gene_length)
r+geom_histogram()


