#!/public/software/R-3.6.0/bin/R

argv<-commandArgs(TRUE)
pdf(argv[2],7,6)

data1 = read.table(argv[1],sep = "\t", header = TRUE)
head(data1)
library(ggpubr)
my_comparisons <- list(c("BIG", "CER"), c("CER", "PIM"), c("BIG", "PIM"))


pvalue_group <- compare_means(SlFM0600~class, data=data1) #Pairwise comparisons

pvalue <- compare_means(SlFM0600~class, data=data1,  method = "anova")


pvalue_total <- rbind(pvalue_group$p.format,pvalue$p.format)
new_pvalue <- cbind(argv[1],pvalue_total[1,1],pvalue_total[1,2],pvalue_total[1,3],pvalue_total[2,3])
write.table(new_pvalue, file= "pvalue.txt", append = TRUE, sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)

p2 <- ggboxplot(data1, x="class", y="SlFM0600", color = "class",palette = c("#0000CC","#FF6600","#006633"),xlab = NULL)+
  stat_compare_means(comparisons=my_comparisons)+
  stat_compare_means(method = "anova")
p2


dev.off()
