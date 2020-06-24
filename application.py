import os
from flask import Flask, render_template, request,redirect,session,url_for,jsonify,json
from flask_mysqldb import MySQL
from flask_session import  Session
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__,static_folder="static")


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'tamaga_shop'

# Configure session to use filesystem
app.config["SESSION_PERMANENT"] =False
app.config["SESSION_TYPE"] ="filesystem"
Session(app)

mysql = MySQL(app)

@app.route('/', methods=['GET','POST'])
def index():
    
        
        
       

        return redirect(url_for('indexU',idU=0))   
    

@app.route('/<idU>', methods=['GET','POST'])
def indexU(idU):
    
        
         
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM products ")
        data=cur.fetchall()
        mysql.connection.commit()
        cur.close()
        if idU==0:
            return redirect(url_for('indexU'))
        
        cur =mysql.connection.cursor()
        cur.execute("SELECT topP1 ,topP2, topP3 FROM users WHERE UserID=%s",(idU))
        data3=cur.fetchall()
        cur.close()
        if data3 :

            print(data3)
            cur =mysql.connection.cursor()  
            cur.execute("SELECT * FROM products WHERE ProductID in ('%s','%s','%s')",(data3[0][0],data3[0][1],data3[0][2]))
            data_C=cur.fetchall()
            mysql.connection.commit()
            cur.close()
            print(data_C)
        else :
            data_C=""
        return render_template('index.html',data=data,dataU=idU,dataC=data_C)





@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
       
       user=request.form['mail']
       password=request.form['pass']
       cur = mysql.connection.cursor()
       cur.execute("SELECT UserID , UserFirstName FROM users WHERE UserEmail= %s AND UserPassword= %s ",(user,password))
       data=cur.fetchall()
       mysql.connection.commit()
       cur.close()

       if not data :
           return render_template('signin.html') 
       else :
           username=data[0][1]
           dat=data[0][0]
           print(dat)
           session["USERNAME"]=username
          
           return redirect(url_for('indexU',idU=dat))
          
    return render_template  ('login.html') 
    
@app.route('/logout')
def logout():
        session.clear()
        
        return redirect(url_for('indexU',idU=0))   
    
   

@app.route('/signin',methods =['GET','POST'])
def signin(): 
    if request.method == 'POST':
       
       user=request.form['mail']
       password=request.form['pass']
       cur = mysql.connection.cursor()
       cur.execute("SELECT UserID , UserFirstName FROM users WHERE UserEmail= %s AND UserPassword= %s ",(user,password))
       data=cur.fetchall()
       
       cur.close() 
       
       if  data :
           
           return render_template('login.html') 
           
       else :
           name=request.form['name']
           Lname=request.form['Lname']
           phone=request.form['phone']
           city=request.form['city']
           state=request.form['state']
           zipp=request.form['zip']
           adr=request.form['adr']
           curs = mysql.connection.cursor()
           curs.execute("""INSERT INTO `users`(`UserEmail`, `UserPassword`, `UserFirstName`, `UserLastName`, `UserCity`, `UserState`, `UserZip`, `UserPhone`, `UserAddress`) 
           VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)""",(user,password,name,Lname,city,state,zipp,phone,adr))
           mysql.connection.commit() 
           
           curs.close()
           username=name
           session["USERNAME"]=username
           curs = mysql.connection.cursor()
           curs.execute("SELECT COUNT (*) FROM users")
           nbuser=curs.fetchall
           curs.close()
           return redirect(url_for('indexU',idU=nbuser))
       
       
            
    return render_template  ('signin.html') 

@app.route('/<idU>/product/<id>',methods=['GET','POST'])
def product(idU,id):
    cur = mysql.connection.cursor()
    query= "SELECT * FROM products WHERE ProductID= '%s'"%(id)
    
    cur.execute(query)
    data=cur.fetchall()
    mysql.connection.commit()
    cur.close()
    
    cur =mysql.connection.cursor()
    cur.execute("SELECT * FROM products WHERE ProductID in ('%s','%s','%s')",(data[0][9],data[0][10],data[0][11]))
    data2=cur.fetchall()
    mysql.connection.commit()
    cur.close()
    dataU=idU
    dataJ=[]   
    dataJ.append(idU)
    dataJ.append(id)
    print(dataJ)
    
    cur =mysql.connection.cursor()
    cur.execute("SELECT topP1 ,topP2, topP3 FROM users WHERE UserID=%s",(idU))
    data3=cur.fetchall()
    cur.close()
    if data3  :
        
        print(data3)
        cur =mysql.connection.cursor()  
        cur.execute("SELECT * FROM products WHERE ProductID in ('%s','%s','%s')",(data3[0][0],data3[0][1],data3[0][2]))
        data_C=cur.fetchall()
        mysql.connection.commit()
        cur.close()
        print(data_C)
    else:
        data_C=""
    return render_template('product.html',data=data,data2=data2,dataU=dataU,dataJ=(dataJ),dataC=data_C)



        
        
@app.route('/addnote',methods=['POST'])
def addnote():
    
    data=request.form
    Rate=data.get("rate")
  
    User=data.get('user')
    ProductID=data.get('prod')
    
    print(Rate)
    print(User)
    print(ProductID)
    curs = mysql.connection.cursor()
    curs.execute("SELECT `UserID`, `ProductID` FROM `rating` WHERE  UserID=%s OR ProductID=%s",(User,ProductID))
    data=curs.fetchall()
       
    curs.close() 
    
    if not data:
        cur = mysql.connection.cursor()
    
    
    
    
    
        cur.execute("INSERT INTO `rating`(`UserID`, `ProductID`, `note`) VALUES (%s,%s,%s)",
               (User,ProductID, Rate))
        mysql.connection.commit()
        cur.close()
    return "Nothing"

@app.route('/cart',methods=['GET'])
def cart():

    
    return render_template('cart.html')


if __name__=="__main__":
    app.run(debug=True)