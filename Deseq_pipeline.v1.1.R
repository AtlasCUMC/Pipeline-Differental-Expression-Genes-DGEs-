###########Referecne: https://www.bioconductor.org/help/workflows/rnaseqGene/ 

args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==1) {
  stop("At least two arguments must be supplied (input file).n", call.=FALSE)
} else if (length(args)==2) {
  # default output file
 args[2] = "out.txt"
}


########################

n = args[1]

out1=as.numeric(n)+9
out <- args[out1]

############################

n <- as.numeric(n)
N = n

sampleFiles= c(args[1:N+1])

sampleFiles

#######################

M <- N+2

M1 <- (2*N)+1

sampleCondition <- c(args[M:M1])



##############################

sessionInfo()

library(DESeq2)

directory <- getwd()

sampleTable <- data.frame(sampleName = sampleFiles,fileName = sampleFiles,condition = sampleCondition)

sampleTable 

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,directory = getwd(), design= ~ condition)

dds <- DESeq(ddsHTSeq)
res <- results(dds)

msuffix <- paste(".txt", sep="")

#c(paste("BT021.counts", msuffix, sep="")

write.csv(as.data.frame(results(dds)),file="Uti.csv")


fig1 <- sprintf("conunts_%s.png",out)

png(fig1)

plotCounts(dds, gene=which.min(res$padj), intgroup="condition")

dev.off()

d <- plotCounts(dds, gene=which.min(res$padj), intgroup="condition",returnData=TRUE)

fig2 <- sprintf("conunts1_%s.png",out)

png(fig2)
library("ggplot2")
ggplot(d, aes(x=condition, y=count))
geom_point(position=position_jitter(w=0.1,h=0))
scale_y_log10(breaks=c(25,100,400))
dev.off()

Sys.time()

cat ("Good Bye!!!!", "\n")


#Example: Rscript  Deseq_pipeline.1.2.R  8  BT021.counts.txt BT048.counts.txt BT074.counts.txt BT081.counts.txt BT082.counts.txt BT099.counts.txt BT110.counts.txt BT111.counts.txt ctr ctr ctr ctr ctr ctr UTI UTI

