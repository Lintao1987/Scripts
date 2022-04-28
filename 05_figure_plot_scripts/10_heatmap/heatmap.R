#!/public/software/R-3.6.0/bin/R

argv<-commandArgs(TRUE)
pdf(argv[3],8,8)

library(ggplot2)
library(limma)
library(pheatmap)
fpkm <- read.table(argv[1], head=T,row.names=1)
head(fpkm)[,1:6]
dim(fpkm)



data=log2(fpkm+1)

genes=names(head(sort(apply(data,1,function(x) 100*sd(x)/mean(x)),decreasing=T),1000))
dat=t(scale(t(data[genes,]))) #

dat[dat>4]= 4
dat[dat< -2]= -2


df_info=data.frame(read.table(argv[2]),stringsAsFactors = F)
head(df_info)

df1 = df_info[,-1,drop=FALSE]
head(df1)



library(RColorBrewer)
library(viridis)

mat_colors <-  list(class = c("#99CC00","#006633"))
names(mat_colors$class) <- unique(df1[,1])

p2<-pheatmap(
  mat=dat,  
  cluster_rows = T,
  cluster_cols = F,
  border_color      = NA, 
  show_colnames     = FALSE,
  show_rownames     = TRUE,
  fontsize          = 12,
  annotation_col    = df1, 
  annotation_colors  = mat_colors,
  drop_levels       = TRUE,
  main              = "PIM-CER SIFM0600 content Heatmap",
  color = colorRampPalette(c("navy", "white","#FF9900", "#990000"))(100),  
)
