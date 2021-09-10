import mysql.connector
from mysql.connector import cursor

db= mysql.connector.connect(
    host='localhost',
    user='root',
    password= '',
    database='blog',
    port=3306
)

def crearUsuarios(nombre,email,contrasena):
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
    
def actualizarUsuarios(id,usuario):
    cursor=db.cursor()
    resultado = cursor.usuario.update_one(
        {
        'id': id
        }, 
        {
            '$set': {
                "nombre": usuario.nombre,
                "precio": usuario.email,
                "cantidad": usuario.contrasena
            }
        })
    return resultado.modified_count

def eliminarUsuarios(id):
    cursor=db.cursor()
    cursor=db.cursor()
    cursor.execute('''delet from 
        usuarios where id=%s'''(
            id
        ))
    print('eliminado')
    db.commit()
    cursor.close()
    



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
            nombre = input('Ingrese el nombre del contacto: ')
            email = input('Ingrese el correo: ')
            contrasena = input('Ingrese la contraseña: ')
        elif opcion==2:
            listarUsuarios()
        elif opcion==3:
            id=int(input('ingrese el ide a modificar: '))
            nombre = input('Ingrese el nombre del contacto: ')
            email = input('Ingrese el correo: ')
            contrasena = input('Ingrese la contraseña: ')
            usuario = usuario(nombre, email, contrasena)
            usuarios_actualizados = actualizarUsuarios(id, usuario)
            print(" actualizados: ", usuarios_actualizados)
        elif opcion==4:
            print("Eliminar")
            id = input("Ingrese el id a eliminar: ")
            eliminado = eliminarUsuarios(id)


menuPrincipal()

