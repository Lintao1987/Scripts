#!/public/software/R-3.6.0/bin/R

argv<-commandArgs(TRUE)
pdf(argv[3],width=45,height=15)

par(mar=c(10,12,3,3),oma=c(0,1,1,1),mgp=c(6.65,2.65,0.65),cex.lab = 4.5)
plot(c(0,0)~1,col="white",xlim=c(0,759.86059),axes=F,xlab="Chromsome",ylim=c(0,40),ylab=expression(-log[10]*(p)))

db <- read.table(argv[1],sep = "\t", header = TRUE)
p_value <- db$P
chr_id <- db$CHR
pos <- db$BP/1000000
log_p_value <- -1*log10(p_value)
length(log_p_value)

db2 <- read.table(argv[2],sep = "\t", header = TRUE)
pi_ration <- db2$Sweep
chr_id2 <- db2$Chromsome
pos_start <- db2$Start/1000000
pos_end <- db2$End/1000000


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


for (i in 1:length(log_p_value)) {
if (chr_id[i] == '1') {
    points(pos[i], log_p_value[i], type ="h" ,cex=1.0, col="#006633");
} else if (chr_id[i] == '2') {
    points(pos[i]+90.304244, log_p_value[i], type ="h", cex=1.0,col="#99CC00");
} else if (chr_id[i] == '3') {
    points(pos[i]+90.304244+49.918294, log_p_value[i], type ="h",cex=1.0,col="#006633");
} else if (chr_id[i] == '4') {
    points(pos[i]+90.304244+49.918294+64.840714,log_p_value[i], type ="h",cex=1.0,col="#99CC00");
} else if (chr_id[i] == '5') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312,log_p_value[i], type ="h",cex=1.0,col="#006633");
} else if (chr_id[i] == '6') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438,log_p_value[i], type ="h",cex=1.0,col="#99CC00");
} else if (chr_id[i] == '7') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636,log_p_value[i], type ="h",cex=1.0,col="#006633");
} else if (chr_id[i] == '8') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621,log_p_value[i], type ="h",cex=1.0,col="#99CC00");
} else if (chr_id[i] == '9') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657,log_p_value[i], type ="h",cex=1.0,col="#006633");
} else if (chr_id[i] == '10') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091,log_p_value[i], type ="h",cex=1.0,col="#99CC00");
} else if (chr_id[i] == '11') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305,log_p_value[i], type ="h",cex=1.0,col="#006633");
} else if (chr_id[i] == '12') {
    points(pos[i]+90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025,log_p_value[i], type ="h",cex=1.0,col="#99CC00");
}
}


axis(side=1, at=c(90.304244/2,90.304244+49.918294/2,90.304244+49.918294+64.840714/2,90.304244+49.918294+64.840714+64.064312/2,90.304244+49.918294+64.840714+64.064312+65.021438/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025/2,90.304244+49.918294+64.840714+64.064312+65.021438+46.041636+65.268621+63.032657+67.662091+64.834305+53.386025+65.486253/2),labels=c("1","2","3","4","5","6","7","8","9","10","11","12"),pos=-0.60,las=1,lwd=2.2, cex.axis = 3.5,tck= -0.02)
axis(side=2,at=seq(0,40,5),labels=seq(0,40,5),pos=-31,las=1,lwd=2.2,cex.axis = 3.5,tck=-0.02)

genomewideline <- -log10(1.042643e-03)
abline(h=genomewideline,lty=5,lwd=3,col='black')

#plot selected sweeps for pi value
for (i in 1:length(pi_ration)) {
if (chr_id2[i] == 'ch01') {
    lines(c(pos_start[i],pos_end[i]), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch02') {
    lines(c(pos_start[i]+len2,pos_end[i]+len2), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch03') {
    lines(c(pos_start[i]+len3,pos_end[i]+len3), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch04') {
    lines(c(pos_start[i]+len4,pos_end[i]+len4), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch05') {
    lines(c(pos_start[i]+len5,pos_end[i]+len5), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch06') {
    lines(c(pos_start[i]+len6,pos_end[i]+len6), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch07') {
    lines(c(pos_start[i]+len7,pos_end[i]+len7), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch08') {
    lines(c(pos_start[i]+len8,pos_end[i]+len8), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch09') {
    lines(c(pos_start[i]+len9,pos_end[i]+len9), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch10') {
    lines(c(pos_start[i]+len10,pos_end[i]+len10), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch11') {
    lines(c(pos_start[i]+len11,pos_end[i]+len11), c(-0.2,-0.2),"l", col = "red", lwd = 8);
} else if (chr_id2[i] == 'ch12') {
    lines(c(pos_start[i]+len12,pos_end[i]+len12), c(-0.2,-0.2),"l", col = "red", lwd = 8);
}
}


#add gene position
SUCR <- c(len3 + 47.397595, len3 + 47.401871)

abline(v=SUCR,lty=2,lwd=1,col="black")


dev.off()
