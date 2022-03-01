#!/usr/bin/bash
#This program want to found those genes within putative domestication sweeps.

#for the ITAG2.3_gene_models.gff3, we can downloaded from https://solgenomics.net/organism/Solanum_lycopersicum/genome.
#command line
python3 genes_within_putative_sweeps.py Domestication_sweeps.txt ITAG2.3_gene_models.gff3 Domestication_genes.txt
