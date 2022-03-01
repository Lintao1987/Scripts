#!~/bin/python
#This program want to combine Domestication/improvement region
#Encoding = utf8

import sys,re

flag = 0
number = 1

f1 = open(sys.argv[1],"r") #input file
f2 = open(sys.argv[2],"w") #output

header = "#Chromsome\tStart\tEnd\tLength(bp)\tP\t-log10(p)"
f2.write("{0}\n".format(header))

for eachline1 in f1:
	first_list = eachline1.strip().split("\t")
	if eachline1 and first_list[0] != "SNP":
		first_list_0 = re.split("_",first_list[0])
		if flag == 0:
			form_chr_ID = first_list_0[0][6:] #Chromsome id
			start_pos = int(first_list[2]) #the start of sweeps regions
			form_chr_pos = int(first_list[2]) #the former position
			form_chr_p = float(first_list[3]) # p value
			form_chr_log10p = float(first_list[4]) #-log10(p)
			flag = 1
		elif flag == 1:
			if first_list_0[0][6:] == form_chr_ID:
				if (int(first_list[2]) - (int(form_chr_pos) + 100000)) <= 200000: #less than 200kb between two regions
					form_chr_p += float(first_list[3])
					form_chr_log10p += float(first_list[4])	
					number += 1
					form_chr_pos = int(first_list[2])
				else:
					f2.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\n".format(form_chr_ID,start_pos,form_chr_pos + 100000, form_chr_pos - start_pos + 100000, form_chr_p/number,form_chr_log10p/number))
					number = 1
					form_chr_ID = first_list_0[0][6:]
					start_pos = int(first_list[2]) #the start of sweeps regions
					form_chr_pos = int(first_list[2]) #the former position
					form_chr_p = float(first_list[3]) # p value
					form_chr_log10p = float(first_list[4]) #-log10(p)
			else:
				f2.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\n".format(form_chr_ID,start_pos,form_chr_pos + 100000, form_chr_pos - start_pos + 100000, form_chr_p/number,form_chr_log10p/number))
				number = 1
				form_chr_ID = first_list_0[0][6:]
				start_pos = int(first_list[2]) #the start of sweeps regions
				form_chr_pos = int(first_list[2]) #the former position
				form_chr_p = float(first_list[3]) # p value
				form_chr_log10p = float(first_list[4]) #-log10(p)
f2.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\n".format(form_chr_ID,start_pos,form_chr_pos + 100000, form_chr_pos - start_pos + 100000, form_chr_p/number,form_chr_log10p/number))

f1.close()
f2.close()
