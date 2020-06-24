# -*- coding: utf-8 -*-
"""
Created on Wed Jun 24 21:25:22 2020

@author: Aziiz
"""

import mysql.connector
import numpy
from scipy import spatial

def SimilariteCosinus(idU1,idU2):
    return (1 - spatial.distance.cosine(matriceNote[idU1],matriceNote[idU2]))

conn = mysql.connector.connect(host="localhost",user="root",password="", database="tamaga_shop")



cursor = conn.cursor()

cursor.execute("SELECT COUNT(*) FROM users")
nbUser1=cursor.fetchone()
nbUser=nbUser1[0]

cursor.execute("SELECT COUNT(*) FROM products")
nbproduct1=cursor.fetchone()
nbproduct=nbproduct1[0]

matriceNote=numpy.zeros((nbUser,nbproduct))
for i in range(nbUser):
    for j in range(nbproduct):
        matriceNote[i][j]=-1

cursor.execute("SELECT * FROM rating")


for note in cursor.fetchall():
    print("id product: ",note[1])
    print("id user: ",note[0])
    print("Note: ",note[2])
    i=(note[0])-1
    j=(note[1])-1
    matriceNote[i][j] = note[2]   
    
print(matriceNote)  
print("***********************")  

matriceSimUser=numpy.zeros((nbUser,nbUser))
for u1 in range(nbUser):
    for u2 in range(nbUser):
        matriceSimUser[u1][u2]=SimilariteCosinus(u1,u2)
        
test="UPDATE users SET topP1=NULL,topP2=NULL,topP3=NULL" ;
cursor.execute(test)
for s in range(nbUser):
        
        max=0
        for z in range(nbUser):
            if(matriceSimUser[s][z]>max) and ( matriceSimUser[s][z]<1) :
                max=matriceSimUser[s][z]
                idmax=z+1
        
       
        print("Top 1 du user ",s+1," est",idmax)   
        #update top n
        ch1=str(idmax)
        ch2=str(s+1) #user
        
       
        ch="UPDATE users SET topUser ="+ch1+" WHERE UserID = "+ch2+";"
        cursor.execute(ch)
        set1=set()
        
        for i in range(nbproduct):
            
            if (matriceNote[idmax-1][i]>2) and (matriceNote[s][i]==-1) and (len(set1)<3):
                set1.add(i+1)
                ch3=str(len(set1))
                ch4=str(i+1)
                ch="UPDATE users SET topP"+ch3+" ="+ch4+" WHERE UserID = "+ch2+";"
                cursor.execute(ch)


             
        print("La liste des produits suggerés à",s+1,"est: ",set1)
        
conn.commit()
conn.close()    
