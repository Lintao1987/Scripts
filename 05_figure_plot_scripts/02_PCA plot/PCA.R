#!/public/software/R-3.6.0/bin/R
#command line: Rscript PCR.R PIM_CER_maf.geno.LD0.2.eigenvec.txt PIM_CER_maf.geno.LD0.2.pdf

argv<-commandArgs(TRUE)
pdf(argv[2],8,6)

library(ggplot2)
library(ggpubr)
a = read.table(argv[1],sep = "\t", header = TRUE)
head(a)


theme <- theme(panel.background = element_blank(),panel.border=element_rect(fill=NA,linetype = 1, color="black",size=1),panel.grid=element_line(color="black",size=55),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),strip.background=element_blank(),axis.text.x=element_text(colour="black",size=16),axis.text.y=element_text(colour="black",size=16),axis.title.x=element_text(colour="black",size=16),axis.title.y=element_text(colour="black",size=16),axis.ticks=element_line(colour="black"),axis.ticks.length=unit(0.5,"lines"), plot.margin=unit(c(1,1,1,1),"line"),legend.position=c(0.86,0.85),legend.key = element_rect(color = "white",fill = "white"),legend.title=element_blank())
#legend.background = element_rect(fill=NULL,colour=NULL,size=NULL,linetype=NULL,color=NULL,inherit.blank = FALSE)
#legend.key = element_rect(color = NULL,fill = NULL)
ggplot(a,aes(x=pc1,y=pc2, color=group, shape=group))+
  xlim(-0.16,0.11) + ylim(-0.11,0.32)+
  xlab("Eigenvector1(31.05%)") + ylab("Eigenvector2(11.44%)")+
  geom_point()+ theme +
  scale_color_manual(values = c("#FF6600","#006633")) + 
  scale_shape_manual(values = c(20, 20))  

#show_point_shapes() + 
#  theme_classic()
