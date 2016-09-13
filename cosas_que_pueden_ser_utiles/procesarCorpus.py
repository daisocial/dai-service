# -*- coding: UTF-8 -*-
import formacionOrden as f_o

lines = [line.rstrip('\n') for line in open('corpus.txt')]

i=0
for line in lines:
	print "##",line
	orden=f_o.formacionOrden(line)
	if orden.definirFrase()[1]:
		i+=1