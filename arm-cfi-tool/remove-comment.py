import sys

def sanitize(l):
	if ";" in l:
		l = l.split(";")[0] + "\n"
	if "push{" in l:
		l = l.replace("push{","push {")
	return l

filename = sys.argv[1]
outputname = sys.argv[2]
fin = open(filename,"r")
fout = open(outputname,"w")



lines = fin.readlines()


lines = list(map(lambda x: sanitize(x),lines))
fout.writelines(lines)
fout.close()

