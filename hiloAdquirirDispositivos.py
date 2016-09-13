import time
import urllib2
from xml.dom.minidom import parse, parseString
import Clases as cl
import MySQLdb
import constantesURL as K_url
import random

#Depuracion
import pprint

class hiloAdquirirDispositivos:

	def __init__(self, t=10):
		self.tiempo=t
		self.allHABS=self.allSERVS=self.allDISP=None

	def run_query(self, query=''): 
		datos = [K_url.DB_HOST, K_url.DB_USER, K_url.DB_PASS, K_url.DB_NAME]
		conn = MySQLdb.connect(*datos) # Conectar a la base de datos 
		cursor = conn.cursor()    # Crear un cursor 
		cursor.execute(query)     # Ejecutar una consulta 
	 	result = list()

		if query.upper().startswith('SELECT'): 
			data = cursor.fetchall()   # Traer los resultados de un select 
		else: 
			conn.commit()     # Hacer efectiva la escritura de datos 
			data = None 
	 
		cursor.close()
		conn.close()
		if data:
			columns = cursor.description
			for value in data:
			    tmp = {}
			    for (index,column) in enumerate(value):
			        tmp[columns[index][0]] = column
			    result.append(tmp)

		return result

	def getUrl(self, document):
		web = urllib2.urlopen(document)
		get_web = web.read()
		xmldoc = get_web

		return xmldoc

	def getXMLTree(self, document, nodoBuscado):
		xmldoc = parseString(document)
		itemlist = xmldoc.getElementsByTagName(nodoBuscado)

		return itemlist			

######################################
#
# FUNCIONES QUE ADQUIEREN LAS HOJAS XML DEL SERVIDOR REST
#
######################################

	def getHabitacionesXML(self, url):	
			urlXML=self.getUrl(url)
			listaHabitaciones= self.getXMLTree(urlXML, 'room')
			resultado=list()
			for s in listaHabitaciones:
				try:
					nombre=s.childNodes[0].toxml()
					habAux=cl.Habitacion(nombre)
					resultado.append(habAux)
				except KeyError as ex:
					print "No existe el atributo "+str(ex)

			self.allHABS=resultado
			return resultado

	def getServiciosXML(self, url):	
			urlXML=self.getUrl(url)
			listaServicio= self.getXMLTree(urlXML, 'service')
			resultado=list()
			for s in listaServicio:
				try:
					nombre=s.childNodes[0].toxml()
					habAux=cl.Servicio(nombre)
					resultado.append(habAux)
				except KeyError as ex:
					print "No existe el atributo "+str(ex)
			self.allSERVS=resultado
			return resultado			

	def getDispositivosXML(self, url):	
		urlXML=self.getUrl(url)
		listaDispositivos= self.getXMLTree(urlXML, 'device')
		resultado=list()
		for s in listaDispositivos:
			try:
				nombre=s.attributes['name'].value
				identificador=s.attributes['id'].value
				tipoDisp=s.attributes['deviceType'].value
				tipoCompon=s.attributes['componentType'].value
				habitacion=s.getElementsByTagName('place')[0].childNodes[0].toxml()
				servicio=s.getElementsByTagName('services')[0].childNodes[0].toxml()
				
				props=list()
				k=s.getElementsByTagName('properties')[0]
				for propiedad in k.childNodes:
					mAcceso=propiedad.attributes['accessMode'].value
					tipo=propiedad.attributes['type'].value
					nomProp=propiedad.attributes['name'].value

					auxProp=cl.Propiedad(nomProp, tipo, mAcceso, None)
					props.append(auxProp)

				auxDisp=cl.Dispositivo(nombre, identificador, habitacion, servicio, tipoDisp, tipoCompon, props)				
				resultado.append(auxDisp)

			except KeyError as ex:
				print "No existe el atributo "+str(ex)

		self.allDISP=resultado
		return resultado

######################################
#
# FUNCIONES QUE INSERTAN EB LA BD LO ADQUIRIDO DE LAS XML
#
######################################

	def insertarHabitacionServicioDB(self):
		if not self.allHABS or not self.allSERVS:
			mensaje="Primero tienes que adquirir los datos XML de las habitaciones y los servicios"
			mensaje+="\nUsa getServiciosXML() y getHabitacionesXML()"
			raise cl.ExcepcionAISOY(mensaje)

		print "Insertando estancias... ",
		for h in self.allHABS:
			cadenaInsert="INSERT IGNORE INTO "+K_url.TABLA_HABITACIONES+" (nombre) "
			cadenaInsert+="VALUES ('"+h.nombre+"')"
			
			self.run_query(cadenaInsert)
		print "OK"

		print "Insertando servicios... ",
		for s in self.allSERVS:
			cadenaInsert="INSERT IGNORE INTO "+K_url.TABLA_SERVICIOS+" (nombre) "
			cadenaInsert+="VALUES ('"+s.nombre+"')"
			self.run_query(cadenaInsert)
		print "OK"	
		return True		

	def insertarPropiedadesDB(self):
		todosDispositivos=self.allDISP
		print "Insertando propiedades... ",
		for d in todosDispositivos:
			for p in d.propiedades:
				cadenaInsert="INSERT IGNORE INTO "+K_url.TABLA_PROPIEDADES+" (nombre, tipo, acceso) "
				cadenaInsert+="VALUES ('"+p.nombre+"', '"+p.tipo+"', '"+p.modo+"');\n"
				self.run_query(cadenaInsert)

		for d in todosDispositivos:
			for p in d.propiedades:
				cadenaInsert="INSERT IGNORE INTO "+K_url.TABLA_DISP_TIENE_PROPIEDAD+" (idDisp, idProp) "
				cadenaInsert+="VALUES ("+d.identificador+", '"+p.nombre+"');"
				self.run_query(cadenaInsert)
		print "OK"

	def insertarDispositivosDB(self):
		todosDispositivos=self.allDISP
		print "Insertando dispositivos... ",
		for d in todosDispositivos:
			cadenaInsert="INSERT INTO "+K_url.TABLA_DISPOSITIVOS+" (nombre, tipoDispositivo, tipoComponente, rHab, servicio) "
			cadenaInsert+="SELECT '"+d.nombre+"', '"+d.tipoDispositivo+"', '"+d.tipoComponente+"', h.id, s.id "
			cadenaInsert+=" FROM "+K_url.TABLA_HABITACIONES+" h, "+K_url.TABLA_SERVICIOS+" s"
			cadenaInsert+=" WHERE h.nombre='"+d.habitacion+"' AND s.nombre='"+d.servicio+"'"
			self.run_query(cadenaInsert)
		print "OK"			

	def borrarDB(self):
		todasTablas=(K_url.TABLA_DISPOSITIVOS, K_url.TABLA_DISP_TIENE_PROPIEDAD, K_url.TABLA_HABITACIONES, K_url.TABLA_PROPIEDADES, K_url.TABLA_SERVICIOS)
		for tt in todasTablas:
			cadenaInsert="DELETE FROM "+tt+" WHERE 1=1;"
			self.run_query(cadenaInsert)

		todasTablas=(K_url.TABLA_DISPOSITIVOS, K_url.TABLA_HABITACIONES, K_url.TABLA_SERVICIOS)
		for tt in todasTablas:
			cadenaInsert="ALTER TABLE "+tt+" AUTO_INCREMENT=1;\n"
			self.run_query(cadenaInsert)			

	def instalarDB(self):
		self.getHabitacionesXML(K_url.todosHABITACIONES)
		self.getServiciosXML(K_url.todosSERVICIOS)
		self.getDispositivosXML(K_url.todosDISPOSITIVOS)
		self.insertarHabitacionServicioDB()
		self.insertarDispositivosDB()
		self.insertarPropiedadesDB()

try:
	start_time = time.time()
	sDisp=hiloAdquirirDispositivos()
	sDisp.borrarDB()
	sDisp.instalarDB()
	print "Tiempo total: ", time.time()-start_time, " s."
except urllib2.URLError as ex:
	print "No se ha podido establecer conexion con el servidor REST (DAILab)"
	print "[Error 404] ", ex.url
	print "Comprueba si existe conexion al laboratorio"