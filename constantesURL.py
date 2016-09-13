import urllib2
# -*- coding: UTF-8 -*-

#################################
#
#		VARIABLES PARA URL DE LA BD
#
#################################

DB_HOST = 'localhost' 
DB_USER = 'root' 
DB_PASS = 'raspberry' 
DB_NAME = 'db_tfg2'

#################################
#
#		VARIABLES PARA URL DEL REST
#
#################################

HOST_REST = 'http://shanon.iuii.ua.es/s/rest'
todosDISPOSITIVOS= HOST_REST+"/home/all/home-devices"
todosHABITACIONES=HOST_REST+"/home/all/home-rooms"
todosSERVICIOS=HOST_REST+"/home/all/home-services"

deviceIO = HOST_REST+'/home/device/{disp}'
propREAD = '/read/{prop}'
propWRITE = '/write/{prop}/{value}'
TABLA_DISPOSITIVOS="dispositivo"
TABLA_DISP_TIENE_PROPIEDAD="disptienepropiedad "
TABLA_HABITACIONES="habitacion"
TABLA_ORDENES="pilaordenes"
TABLA_PROPIEDADES="propiedad"
TABLA_SERVICIOS="servicio"

#################################
#
#VARIABLES PARA RECONOCIMIENTO AUTOMATICO DE VOZ
#
#################################

cmd_KEY=("fermin", "robot")
cmd_PARADA=	("stop","parar","detenter", "cerrar","bajar", "baja","apagar", "desactiva")
cmd_INICIO=	("abrir", "decir", "dime", "comunicar", "encender", "subir", "llamar", "activo")
cmd_EMERGENCIA = ("pedir_ayuda", "auxilio", "llamar_policia")
cmd_ORGANIZACION=("samur", "rescate", "bombero", "tienda" , "supermercado")

LISTA_TELEFONOS=(\
	("Maria", "hija", "666000661"), \
	("Juan", "hijo", "666000662"), \
	("Rosana", "mujer", "666000663"), \
	("Alberto", "marido", "666000665"), \
	("Vicente", "enfermero", "788000909"), \
	("Ana", "enfermera", "788000910"), \
	("Ramiro", "doctor", "788000911"), \
	("Ramiro", "medico", "788000911"))


def tts(frase):
	urlTTS=HOST_REST+"/tts/loquendo/speak/simple/"+frase
	web = urllib2.urlopen(urlTTS)
	get_web = web.read()
	xmldoc = get_web
	print "<<Emitiendo>>:", frase
