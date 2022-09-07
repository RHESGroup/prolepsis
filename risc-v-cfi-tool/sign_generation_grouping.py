import random
import math
import numpy as np
from itertools import chain

# split the number to maximum power of 2 numbers
def brecking(x):
    powers = []
    i = 1
    while i <= x:
        if i & x:
            powers.append(i)
        i <<= 1
    return powers

def rebrecking(x):
  powers = brecking(x)
  if (x >= 8):
    while len(powers) < 8:
      if powers[-1] > 1 :
        powers.append((powers[-1])/2)
        powers.append((powers[-2])/2)
        powers.sort()
        powers.pop()
  else:
    for i in range(len(powers),8):
      powers.append(0)
  return powers


# generate configurable memory data
def bin_config_mem(a, nota):  
  myarr=[""]*10 
  m = 0
  res = []
  for j in range(len(a)):
    for i in range(20):
      n = m//16
      m += 1
      if (not a[j] and not nota[j]):
        myarr[n] = "11"+myarr[n]
      elif i in a[j]:
        myarr[n] = "01"+myarr[n]
      elif i in nota[j]:
        myarr[n] = "00"+myarr[n]
      else:
        myarr[n] = "10"+myarr[n]
  res = [hex(int(x, 2)) for x in myarr]
  return res

#Calculate the decimal number of signatures
def gen_primes(x): 
    res = 0
    for i in range (0, len(x)):
        res += 2**x[i]
    return res

#Call different groups
def call_groups(primes,x,y,bits):
  prime1 =[]
  for i in range(0, len(x)):
    prime1.append(rec_group(x[i],y[i], bits-1, [])) 
  flat_list = [item for sublist in prime1 for item in sublist]
  return flat_list
#assign random member for each group
def mk_gr (int_primes, x, flag, numNeq, bits):
  m = []
  notm = []
  notVal = 0
  zeros =list(range(0, bits))
  for i in range (0, len(x)):
    temp = format(i, "b").zfill(3)
    res = [int(x) for x in str(temp)]
    res = res[::-1]
    if (x[i] > 0):
      m.append(int_primes[0:x[i]])
      notm.append(int_primes[x[i]:bits])
      temp = format(random.randint(0, 2**(len(m[i])-5)), "b").zfill(len(m[i])-5)
      res2 = [int(x) for x in str(temp)]
      res= res+ res2
      for j in reversed(range(len(res))):
        if res[j] == 1:
          m[i][j] = "~"+ str(m[i][j])
          m[i].pop(j)
    else:
      m.append([])
      notm.append([])
  return m, notm
  
#Generate the group members 
def rec_group(ones, challenge, numberOfBits, generatedSig):
  newOnes = ones[:]
  if (numberOfBits >= 0):
    if not numberOfBits in challenge:
      rec_group(newOnes, challenge, numberOfBits-1, generatedSig)
    else:
      for a in range(2):
        if a == 0 :
          rec_group(newOnes, challenge, numberOfBits-1, generatedSig)
        else :
          newOnes.append(numberOfBits)
          rec_group(newOnes, challenge, numberOfBits-1, generatedSig)
  elif challenge or ones:
    i = gen_primes(newOnes)
    if i not in generatedSig:
      generatedSig.append(i)
  return generatedSig
  
#The main function to call and generate signatures
def gen_number(num , bits):
  x = rebrecking(num)
  zeros = x.count(0)
  x = [int(a) for a in x]
  y = [int(bits-math.log2(a)) for a in x if (a > 0)]
  y.extend([0] * zeros)
  primes = list(range((bits)))
  m, n = mk_gr (primes, y, 0, 0, bits)
  l = call_groups(primes,m,n,bits)
  return l, m, n

gen_number(5,20)

