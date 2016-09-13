import socket
import sys
from thread import *
from http_parser.parser import HttpParser
import formacionOrden as f

def _cutFrase(peticion, patronCorte):
    frase=peticion.split(patronCorte)
    if len(frase)>1:
        frase=frase[1].replace("+", " ")
        return frase
    else:
        return None
 
HOST = ''   # Nombre del host
PORT = 8888 # Puerto 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket creado'
 
#Creamos el socket con el host y el puerto
try:
    s.bind((HOST, PORT))
except socket.error as msg:
    print 'Error al enlazar. Error : ' + str(msg[0]) + '[Mensaje: ' + msg[1]+']'
    sys.exit()
     
print 'Socket enlazado'
 
#Ponemos 10 hilos a escuchar
s.listen(10)
print 'Socket escuchando'
 
#Ponemos el servicio en marcha
try:
    while 1:
        conn, addr = s.accept()
        #print 'Conexion establecida con ' + addr[0] + ':' + str(addr[1])
        datosRecibidos = conn.recv(1024)
        if not datosRecibidos:
            #SUSTITUIR POR??
            #continue
            break
        longitudDatos = len(datosRecibidos)
        p = HttpParser() 
        p.execute(datosRecibidos, longitudDatos)
        respuesta = '<html>\n<head>\n<meta charset="UTF-8">\n</head>\n<body>\n<pre>\n'
        respuesta += 'Procesando peticion...\n'

        text=_cutFrase(p.get_query_string(), "frase=")
        if text:
            print 'He recibido \"'+text+"\"\n"
            #Creamos la orden de la clase formacionOrden con la frase decodificada
            orden=f.formacionOrden(text)
            #Definimos la frase y se realizan las acciones pertinente
            respuesta+=orden.definirFrase()[0]
        else:
            print "No se ha podido procesar la peticion "+str(text)
            respuesta+="\nNo se ha podido procesar la peticion"
            respuesta+="\nLa url debe tener el argumento <strong>?frase=[Orden enviada]</strong>"
        
        respuesta += '</pre>\n</body>\n</html>\n'

        cabecera="HTTP/1.1 200 OK\n\r"
        cabecera+="Server: Apache/2.2.14 (SocialAISOY)\n\r"
        cabecera+="Content-Length: "+ str(len(respuesta))+"\n\r"
        cabecera+="Content-Type: text/html\n\r"
        cabecera+="Connection: Closed\n\r\n\r"

        conn.sendall(cabecera+respuesta)
        conn.close()
except KeyboardInterrupt as ex:
    s.close()
    print "Socket cerrado"

