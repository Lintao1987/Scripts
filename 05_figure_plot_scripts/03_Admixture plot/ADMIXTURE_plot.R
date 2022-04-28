#!/public/software/R-3.6.0/bin/R


data <- read.table("sort_PIM_CER.txt")
tbl <- data[,2:3]
pdf("PIM_CER_maf_geno_LD02_ADMIXTURE_2_Q.pdf",10,4)
barplot(t(as.matrix(tbl)), col=c("#006633","#FF6600"),xlab="Individual", ylab="K=2", border=NA)
dev.off()


