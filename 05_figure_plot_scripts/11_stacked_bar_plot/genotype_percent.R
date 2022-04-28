#!/public/software/R-3.6.0/bin/R

argv<-commandArgs(TRUE)
pdf(argv[2],8,6)
# library
library(ggplot2)

data <- read.table(argv[1], header = TRUE)

data
theme <- theme(panel.background = element_blank(),panel.border=element_rect(fill=NA,linetype = 1, color="black",size=1),panel.grid=element_line(color="black",size=55),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),strip.background=element_blank(),axis.text.x=element_text(colour="black",size=16),axis.text.y=element_text(colour="black",size=16),axis.title.x=element_text(colour="black",size=16),axis.title.y=element_text(colour="black",size=16),axis.ticks=element_line(colour="black"),axis.ticks.length=unit(0.5,"lines"), plot.margin=unit(c(1,1,1,1),"line"),legend.key = element_rect(color = "white",fill = "white"),legend.title=element_blank())

# Stacked + percent
ggplot(data, aes(fill=genotype, y=value, x=class)) + 
  geom_bar(position="fill", stat="identity") +
  xlab("") + ylab("percent") +
  theme

dev.off()

