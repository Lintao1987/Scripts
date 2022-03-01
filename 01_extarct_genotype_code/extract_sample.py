#!/usr/bin/python3
#This program want to extract sample PIM_CER, CER_BIG...seprately
#date:2020.2.27
#encoding = utf8

import sys,re,os
import argparse

parser=argparse.ArgumentParser(description='extracted the PIM-CER or CER-BIG genotype from the PIM-CER-BIG genotype file')
parser.add_argument('-input1',type =argparse.FileType('r'), help='the individual_ID informaton file')
parser.add_argument('-input2',type =argparse.FileType('r'), help='the all samples genotype file')
parser.add_argument('-group1',type =str, help='the name of group1')
parser.add_argument('-group2',type =str, help='the name of group2')
parser.add_argument('-o', type =argparse.FileType('w'), help='The output file name')
args=parser.parse_args()

debug = True

TS = []
Sel_TS_index = []
snp = []

for eachline1 in args.input1:
	list1 = eachline1.strip().split("\t")
	if not eachline1 or list1[0] == "ID1":
		continue
	else:
		TS.append(list1[1])
		if list1[2] == args.group1 or list1[2] == args.group2:
			index = TS.index(list1[1])
			Sel_TS_index.append(index)


for eachline2 in args.input2:
	list2 = eachline2.strip().split("\t")
	list2_3 = list2[3].strip().split(" ")
	snp = []
	for i in Sel_TS_index:
		snp.append(list2_3[i])
	args.o.write("{0}\t{1}\t{2}\t{3}\n".format(list2[0],list2[1],list2[2]," ".join(snp)))

args.input1.close()
args.input2.close()
args.o.close()

