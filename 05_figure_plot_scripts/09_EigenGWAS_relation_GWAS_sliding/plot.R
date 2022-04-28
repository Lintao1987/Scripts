#!/public/software/R-3.6.0/bin/R


argv<-commandArgs(TRUE)
pdf(argv[2],6,6)


phenotype <- read.table(argv[1],header = TRUE, sep = "\t")
head(phenotype)

a <- subset(phenotype,phenotype$EigenGWAS_P <= 1.042643e-03 & phenotype$GWAS_log10P >= 1.050030e+00) #EigenGWAS P value 与 GWAS P avlue > Threshold line
b <- subset(phenotype,phenotype$EigenGWAS_P <= 1.042643e-03 & phenotype$GWAS_log10P < 1.050030e+00) # EigenGWAS P value > Threshold line
c <- subset(phenotype,phenotype$EigenGWAS_P > 1.042643e-03 & phenotype$GWAS_log10P >= 1.050030e+00) # GWAS P avlue > Threshold line
d <- subset(phenotype,phenotype$EigenGWAS_P > 1.042643e-03 & phenotype$GWAS_log10P < 1.050030e+00) # EigenGWAS P value 与 GWAS P avlue < Threshold line

write.csv(a, file= "EigenGWAS_GWAS_threshold_line.csv")

x <- paste("EigenGWAS", "-log10(p)", sep = " ", collapse = NULL)
y <- paste("SlFM0600 GWAS", "-log10(p)", sep = " ", collapse = NULL)


plot(c(0,0)~1,col="white", pch=16,xlab=x, ylab = y,xlim=c(0,25),ylim=c(0,3),type="p",cex=0.6, font.axis=1, font.lab=1,cex.lab=1)
points(-log10(a[,4]),a[,5],pch=16, type="p",cex = 0.6,col= rgb(255, 0, 255, 255, maxColorValue=255))
points(-log10(b[,4]),b[,5],pch=16, type="p",cex = 0.6,col= rgb(0, 0, 200, 255, maxColorValue=255))
points(-log10(c[,4]),c[,5],pch=16, type="p",cex = 0.6,col= rgb(0, 255, 0, 255, maxColorValue=255))
points(-log10(d[,4]),d[,5],pch=16, type="p",cex = 0.6,col= rgb(0, 0, 0, 255, maxColorValue=255))
#SlCGT window,SL2.40ch01_81120000_81220000
points(-log10(1.190674e-03),2.402817e+00, pch=16, type="p",cex = 0.6,col= rgb(255,0,0,255,maxColorValue=255))
