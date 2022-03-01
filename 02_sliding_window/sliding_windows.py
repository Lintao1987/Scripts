#!~/bin/python3
#This program want to calculate An average of P value of SNPs located in a given genomic interval was calculated using a sliding window analysis with 100kb window size and 10 kb increment
#encoding=utf8

import sys,re,os
import argparse

parser=argparse.ArgumentParser(description='calculate the index with a sliding window for per chomsome')
parser.add_argument('-input',type=argparse.FileType('r'), help='the name file')
parser.add_argument('-name', type=str, help='the index name file')
parser.add_argument('-len',type=int, help='thr chrsome length')
parser.add_argument('-win',type=int, help='the window size')
parser.add_argument('-sliding',type= int, help='the sliding window size')
parser.add_argument('-o', type=argparse.FileType('w'), help='The output file name')
args=parser.parse_args()

debug = True
value = args.len//args.sliding+1
end = 0
for index in range(0,value):
	if end < args.len:
		start = index*args.sliding
		end = start + args.win
		command1 = "awk '{if ($3 >= "+str(start)+" && $3 <= "+str(end)+") print $0}' "+args.name+" > tem_file" #can only concatenate str (not "int") to str
		os.system(command1)
		new_file = open('tem_file','r')
		value1 = 0
		num = 0
		for eachline in new_file:
			list1 = eachline.strip().split("\t")
			num += 1
			value1 += float(list1[3])
		try:
			average1 = round(value1/num,20)
		except ZeroDivisionError:
			pass
		else:
			average1 = average1
			if int(list1[1]) <= 9:
				chr_id = "SL2.40ch0" + str(list1[1])
				SNP = str(chr_id) + "_" + str(start) + "_" + str(end)
			else:
				chr_id = "SL2.40ch"+ str(list1[1])
				SNP = str(chr_id) + "_" + str(start) + "_" + str(end)			
			args.o.write('%s\t%s\t%s\t%e\n' % (SNP,list1[1],start,average1))
	else:
		start = index*args.sliding
		end = args.len
		command1 = "awk '{if ($3 >= "+str(start)+" && $3 <= "+str(end)+") print $0}' "+args.name+" > tem_file"
		os.system(command1)
		new_file = open('tem_file','r')
		value1 = 0
		num = 0
		for eachline in new_file:
			list1 = eachline.strip().split("\t")
			num += 1
			value1 += float(list1[3])
		try:
			average1 = round(value1/num,20)
		except ZeroDivisionError:
			pass
		else:
			average1 = average1
			if int(list1[1]) <= 9:
				chr_id = "SL2.40ch0" + str(list1[1])
				SNP = str(chr_id) + "_" + str(start) + "_" + str(end)
			else:
				chr_id = "SL2.40ch"+ str(list1[1])
				SNP = str(chr_id) + "_" + str(start) + "_" + str(end)
			args.o.write('%s\t%s\t%s\t%e\n' % (SNP,list1[1],start,average1))
			break
