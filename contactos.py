import mysql.connector
from mysql.connector import cursor

db= mysql.connector.connect(
    host='localhost',
    user='root',
    password= '',
    database='blog',
    port=3306
)

def menuPrincipal():
    opcion=1
    
    while opcion !=0:
        print('---------------------------------')
        print('Menu de contactos')
        print('1. Crear contactos')
        print('2. Listar contactos')
        print('3. Actualizar contactos')
        print('4. Eliminar contactos')
        print('0. Salir')

        opcion = int(input('SELECCIONE UNA OPCION: '))

        if opcion==1:
            crearUsuarios()
        elif opcion==2:
            listarUsuarios()
        elif opcion==3:
            actualizarUsuarios()

            





def crearUsuarios(nombre,email,contrasena):
    nombre = input('Ingrese el nombre del contacto: ')
    email = input('Ingrese el correo: ')
    contrasena = input('Ingrese la contraseña: ')
    cursor=db.cursor()
    cursor.execute('''insert into 
        usuarios(nombre,email,contrasena)
        values(%s, %s, %s)''',(
            nombre,
            email,
            contrasena
        ))
    print('ingresado')
    db.commit()
    cursor.close()

crearUsuarios('nombre','email','contrasena')

def listarUsuarios():
    cursor=db.cursor()
    cursor.execute('select * from usuarios')
    usuarios=cursor.fetchall()
    print(usuarios)

#def actualizarUsuarios():


menuPrincipal()
