import mysql.connector

db= mysql.connector.connect(
    host='localhost',
    user='root',
    password= '',
    database='blog',
    port=3306
)