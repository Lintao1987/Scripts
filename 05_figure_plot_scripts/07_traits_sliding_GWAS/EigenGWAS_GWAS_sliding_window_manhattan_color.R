#!/public/software/R-3.6.0/bin/R

argv<-commandArgs(TRUE)
pdf(argv[3],width=45,height=15)


par(mar=c(10,12,3,3),oma=c(0,1,1,1),mgp=c(6.65,2.65,0.65),cex.lab = 4.5)
plot(c(0,0)~1,col="white",xlim=c(0,759.86059),axes=F,xlab="Chromsome",ylim=c(0,4),ylab=expression(phen -log[10]*(p)))


db_phen <- read.table(argv[1],sep = "\t", header = TRUE)
p_phen <- db_phen$P
chr_phen <- db_phen$CHR
pos_phen <- db_phen$BP/1000000
log_p_phen <- p_phen

db <- read.table(argv[2],sep = ",", header = TRUE)
p_value <- db$GWAS_log10P
chr_id <- db$CHR
pos <- db$BP/1000000
log_p_value <- p_value
length(log_p_value)

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

len1 <- 0
len2 <- 0+90.304244
len3 <- 0+90.304244+49.918294
len4 <- 0+90.304244+49.918294+64.840714
len5 <- 0+90.304244+49.918294+64.840714+64.064312
len6 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438
len7 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636
len8 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621
len9 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657
len10 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091
len11 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305
len12 <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025
lenTotal <- 0+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025+65.486253
print(len12)

for (i in 1:length(log_p_phen)) {
if (chr_phen[i] == '1') {
    points(pos_phen[i], log_p_phen[i], pch=17 ,cex=2.2, col="#99CC00");
} else if (chr_phen[i] == '2') {
    points(pos_phen[i]+ len2, log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '3') {
    points(pos_phen[i]+ len3, log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '4') {
    points(pos_phen[i]+ len4, log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '5') {
    points(pos_phen[i]+ len5,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '6') {
    points(pos_phen[i]+ len6,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '7') {
    points(pos_phen[i]+ len7,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '8') {
    points(pos_phen[i]+ len8,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '9') {
    points(pos_phen[i]+ len9,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '10') {
    points(pos_phen[i]+ len10,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '11') {
    points(pos_phen[i]+ len11,log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
} else if (chr_phen[i] == '12') {
    points(pos_phen[i]+ len12, log_p_phen[i], pch=17 ,cex=2.2,col="#99CC00");
}
}


axis(side=1, at=c(90.304244/2,90.304244+49.918294/2,90.304244+49.918294+64.840714/2,90.304244+49.918294+64.840714+64.064312/2,90.304244+49.918294+64.840714+64.064312+65.021438/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025+65.486253/2),labels=c("1","2","3","4","5","6","7","8","9","10","11","12"),pos=-0.05,las=1,lwd=2.2, cex.axis = 3.5,tck= -0.02)
axis(side=2,at=seq(0,4,1),labels=seq(0,4,1),pos=-11,las=1,lwd=2.2,cex.axis = 3.5,tck=-0.02)

par(new=T)

for (i in 1:length(log_p_value)) {
if (chr_id[i] == '1') {
    points(pos[i], log_p_value[i], pch=17 ,cex=2.2, col="#AB539B");
} else if (chr_id[i] == '2') {
    points(pos[i]+ len2, log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '3') {
    points(pos[i]+ len3, log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '4') {
    points(pos[i]+ len4, log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '5') {
    points(pos[i]+ len5,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '6') {
    points(pos[i]+ len6,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '7') {
    points(pos[i]+ len7,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '8') {
    points(pos[i]+ len8,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '9') {
    points(pos[i]+ len9,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '10') {
    points(pos[i]+ len10,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '11') {
    points(pos[i]+ len11,log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
} else if (chr_id[i] == '12') {
    points(pos[i]+ len12, log_p_value[i], pch=17 ,cex=2.2,col="#AB539B");
}
}


genomewideline <- 1.050030e+00
abline(h=genomewideline,lty=5,lwd=3,col='red')

chr <- c(len2, len3, len4, len5, len6, len7, len8, len9, len10, len11, len12,lenTotal)
abline(v=chr,lty=2,lwd=1,col="black")



dev.off()
