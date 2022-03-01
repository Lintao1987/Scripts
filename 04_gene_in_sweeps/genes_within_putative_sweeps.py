#!~/bin/python
#This program want to judge those genes within putative sweeps
#encoding = utf8

import sys,re,os

f1 = open(sys.argv[1],"r") #Domestication_sweeps.txt
f2 = open(sys.argv[2],"r") #ITAG2.3_gene_models.gff3
f3 = open(sys.argv[3],"w") 

chr1_12 = {}

for eachline1 in f1:
	list1 = eachline1.strip().split("\t")
	if not eachline1 or list1[0] == "Sweep":
		continue
	else:
		for a in range(int(list1[2]), int(list1[3])+1):
			ch_loc = str(list1[1]) + "_" + str(a)
			chr1_12[ch_loc] = list1[0]
header = "Chromsome\tGene_ID\tStart\tEnd\tLength\tEigen_Improvement_Sweep_Region\tInterPro_description"
f3.write("{0}\n".format(header))		
for eachline2 in f2:
	list2 = eachline2.strip().split("\t")
	if not eachline2 or eachline2[0] == "#":
		continue
	else:
		if list2[2] == "mRNA":
			list2_8 = re.split("=|:|;",list2[8])
			for i in range(0,len(list2_8),1):
				if "gene" == list2_8[i]:
					gene_ID = list2_8[i+1]
				if "Note" == list2_8[i]:
					function = list2_8[i+1]
			start = list2[3]
			end = list2[4]
			length = int(list2[4]) - int(list2[3]) + 1
			for b in range(int(list2[3]), int(list2[4])+1):
				chr_gen_loc = str(list2[0][6:]) + "_" + str(b)
				if chr_gen_loc in chr1_12.keys():
					f3.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\n".format(list2[0][6:], gene_ID, start, end, length, chr1_12[chr_gen_loc],function))
					break

f1.close()
f2.close()
f3.close()
