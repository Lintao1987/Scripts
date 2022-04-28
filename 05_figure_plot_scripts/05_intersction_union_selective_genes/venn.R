#!/public/software/R-3.6.0/bin/R

argv<-commandArgs(TRUE)

pdf(argv[2],width=6,height=6)

library(VennDiagram)
dat <- read.table(argv[1], header = TRUE, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
head(dat)

venn_list <- list(pi = dat$pi, EigenGWAS = dat$EigenGWAS)


venn.plot <- venn.diagram(venn_list, filename = NULL,
             fill = c('red', 'blue'), alpha = 0.50, cat.col = rep('black', 2),
             col = 'transparent', cex = 1.5,fontfamily = 'serif',
             cat.cex = 1.5, cat.fontfamily = 'serif')

grid.draw(venn.plot)
