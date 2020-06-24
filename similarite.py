# -*- coding: utf-8 -*-
"""
Created on Sat Jun 20 00:33:32 2020

@author: Aziiz
"""

import mysql.connector
import nltk
from nltk.stem.snowball import FrenchStemmer
from nltk.corpus import stopwords
import numpy
matriceBin=numpy.zeros((0,0))
matriceBin1=numpy.zeros((0,0))

from scipy import spatial
def SimilariteCosinus(id1,id2):
    return (1 - spatial.distance.cosine(matriceBin[id1],matriceBin[id2]))
def SimilariteCosinus1(id1,id2):
    return (1 - spatial.distance.cosine(matriceBin1[id1],matriceBin1[id2]))

conn = mysql.connector.connect(host="localhost",user="root",password="", database="tamaga_shop")
cursor = conn.cursor()
    
cursor.execute("SELECT * FROM products")
french_stopwords = set(stopwords.words('french'))
stop=list(french_stopwords)
stop.extend([",",".","'",":",";","!","?","(","?","-",'"'])
stemmer = FrenchStemmer()

totaliteMots=set()
totaliteMots1=set()
nbproduct=0
dictMots={}
dictMots1={}

for ligne in cursor.fetchall():
    nbproduct+=1
    print("ID produit",ligne[0])
    desc=ligne[3]+" "+ligne[4]
    mots=nltk.word_tokenize(desc)
   
    Mots = [m for m in mots if m.lower() not in stop]

    
    MotsStem=[]
    for m in Mots:
        MotsStem.append(stemmer.stem(m)) 
    print("-------------------------------")
    print(MotsStem)
    
    for m in MotsStem:
        totaliteMots.add(m)
    dictMots[ligne[0]]=MotsStem  
    
    

nbMots=len(totaliteMots)
print(nbproduct)


matriceBin=numpy.zeros((nbproduct,nbMots))


for i in range(nbproduct):
    j=0
    for m in totaliteMots:
        if m in dictMots[i+1]:
            matriceBin[i][j]=1
        j+=1 
  
matriceSimBin=numpy.zeros((nbproduct,nbproduct))             
      
for s in range(nbproduct):
    for z in range(nbproduct):
        matriceSimBin[s][z]=SimilariteCosinus(s,z)
   
print("*****************************") 
print("Matrice de similarité binaire par description") 
print("*****************************")      
print(matriceSimBin) 



for s in range(nbproduct):
    set1 = set()
    for i in range(3):
        max=0
        for z in range(nbproduct):
            if(matriceSimBin[s][z]>max) and ( matriceSimBin[s][z]<1) and (matriceSimBin[s][z] not in set1):
                max=matriceSimBin[s][z]
                idmax=z+1
        set1.add(max)
        set1.add(max)
        ch1=str(idmax)
        ch2=str(s+1)
        ch3=str(i+1)
        ch="UPDATE products SET top"+ch3+"="+ch1+" WHERE ProductID="+ch2+";"
        cursor.execute(ch)
        print("Top ",i+1," du produit",s+1," par description est",idmax) 
conn.commit()
conn.close()