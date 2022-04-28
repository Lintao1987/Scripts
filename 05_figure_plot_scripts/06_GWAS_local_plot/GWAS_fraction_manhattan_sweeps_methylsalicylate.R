#!/public/software/R-3.6.0/bin/R


argv<-commandArgs(TRUE)
pdf(argv[3],width=10,height=6)

par(mar=c(6,6,2,6),oma=c(0,1,1,1),mgp=c(3,1,0),cex.lab = 1.2)
plot(c(0,0)~1,col="white", xlim = c(65,67), ylim =c(0,2.5), xlab = "methylsalicylate",ylab=expression(window -log[10]*(p)))

db <- read.table(argv[1],sep = "\t", header = TRUE)
p2_value <- db$GWAS_log10P
chr_id <- db$CHR
pos <- db$BP/1000000 + 0.05
log_p2_value <- p2_value
length(log_p1_value)

db_single <- read.table(argv[2],sep = "\t", header = TRUE)
p_single <- db_single$P
chr_single <- db_single$CHR
pos_single <- db_single$BP/1000000
log_p_single <- -1*log10(p_single)

len_chr01 <- 90304244
len_chr02 <- 49918294
len_chr03 <- 64840714
len_chr04 <- 64064312
len_chr05 <- 65021438
len_chr06 <- 46041636
len_chr07 <- 65268621
len_chr08 <- 63032657
len_chr09 <- 67662091
len_chr10 <- 64834305
len_chr11 <- 53386025
len_chr12 <- 65486253



for (i in 1:length(log_p2_value)) {
if (chr_id[i] == '9' & pos[i] >= 65 & pos[i] <= 67) {
	points(pos[i], log_p2_value[i], pch = 17, cex=1.0, col="#006633");
}
}


par(new=T)
plot(c(0,0)~1,col="white",xlim=c(65,67), ylim =c(0,15),axes=F,xlab="",ylab = "",xaxt = "n", yaxt = "n")
mtext(expression(single -log[10]*(p)), side = 4, line = 3.0,cex =1.2, las=0)
axis(side=4)
for (i in 1:length(log_p_single)) {
if (chr_single[i] == '9' & pos_single[i] >= 65 & pos_single[i] <= 67) {
        points(pos_single[i], log_p_single[i], pch = 16,cex=0.5, col="black");
}
}

rect(xleft = 65.550, ybottom = -0.5, xright = 65.650, ytop = -0.2,border = "red", col = "red")
rect(xleft = 66.130, ybottom = -0.5, xright = 66.250, ytop = -0.2,border = "red", col = "red")

abline(v = c(66.150,66.153), col = "lightgray", lty = 3) 
dev.off()
