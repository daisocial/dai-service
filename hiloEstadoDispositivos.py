import time
import urllib2
from xml.dom.minidom import parse, parseString
import Clases as cl
import MySQLdb
import constantesURL as K_url

#Depuracion
import pprint

class hiloEstadoDispositivos:

	def _comprobarConexion(self):
		try:
			print "Comprobando conexion...",
			accesoIni=K_url.todosDISPOSITIVOS
			web = urllib2.urlopen(accesoIni)
			print "OK"
			return True
		except urllib2.HTTPError as ex:
			print "\nNo se ha podido establecer conexion con el servidor REST (DAILab)";
			print "[Error 404] "+accesoIni
			return False

	def __init__(self, t=10):
		self.tiempo=t
		self.DB_HOST = 'localhost' 
		self.DB_USER = 'root' 
		self.DB_PASS = 'raspberry' 
		self.DB_NAME = 'db_tfg2'
		self.allDispositivos=None
		if self._comprobarConexion():
			self.allDispositivos=self.getDispositivosEN()

	def getUrl(self, document):
		web = urllib2.urlopen(document)
		get_web = web.read()
		xmldoc = get_web

		return xmldoc

	def getValueDispositivo(self, url):
		document=self.getUrl(url)
		hojaXML = parseString(document)
		itemlist = hojaXML.getElementsByTagName('value')[0].childNodes[0].toxml()

		return itemlist

	def run_query(self, query=''): 
		datos = [self.DB_HOST, self.DB_USER, self.DB_PASS, self.DB_NAME]
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

	def getDispositivosDB(self, tipoAcceso='READ'):
		queryDisp="SELECT DISTINCT d.nombre 'disp_ombre', d.id 'd_id', d.rHab, servicio, d.tipoDispositivo, d.tipoComponente " 
		queryDisp+="FROM dispositivo as d, propiedad as p, disptienepropiedad as dp "
		queryDisp+="WHERE dp.idDisp=d.id AND dp.idProp=p.nombre"
		if tipoAcceso is not 'TODOS':
			queryDisp+=" AND p.acceso='"+tipoAcceso+"'"
		return self.run_query(queryDisp)

	def getPropiedadesDB(self, idDispoisitivo, tipoAcceso='READ'):
		queryDisp="SELECT p.nombre, p.tipo, p.acceso, dp.ultimoValor " 
		queryDisp+="FROM dispositivo as d, propiedad as p, disptienepropiedad as dp "
		queryDisp+="WHERE dp.idDisp=d.id AND dp.idProp=p.nombre  AND d.id="+str(idDispoisitivo)
		if tipoAcceso is not 'TODOS':
			queryDisp+=" AND p.acceso='"+tipoAcceso+"'"
		return self.run_query(queryDisp)		

	def getDispositivosEN(self, tipoAcceso='READ'):
		dispoDB=self.getDispositivosDB(tipoAcceso)
		dispoEN=list()
		for dEN in dispoDB:
			dispAux=cl.Dispositivo(dEN['disp_ombre'], dEN['d_id'], dEN['rHab'], dEN['servicio'], dEN['tipoDispositivo'], dEN['tipoComponente'], None)
			propDB=self.getPropiedadesDB(dEN['d_id'], tipoAcceso)

			for propEN in propDB:
				propAux=cl.Propiedad(propEN['nombre'], propEN['tipo'], propEN['acceso'], propEN['ultimoValor'])
				dispAux.addPropiedad(propAux)

			dispoEN.append(dispAux)

		return dispoEN

	def insertDispositivoDB(self, dispositivo=None):
		if dispositivo:
			for p in dispositivo.propiedades:
				queryDisp="UPDATE disptienepropiedad SET fecha=CURRENT_TIMESTAMP, ultimoValor='"+p.valor+"'"
				queryDisp+=" WHERE idDisp="+str(dispositivo.identificador)+" AND idProp='"+p.nombre+"'"
				self.run_query(queryDisp)

	def actualizarDispositivos(self):
		for d in self.allDispositivos:
			self.insertDispositivoDB(d)

	def leerEstadosREST(self, tipoAcceso='READ'):
		t0 = time.time()
		if self.allDispositivos:
			print "Adquiriendo valores...",
			for di in self.allDispositivos:
				#print "Adquiriendo ("+str(di.identificador)+") "+di.nombre
				for p in di.propiedades:
					try:
						#print "\t("+p.nombre+")--> ",
						urlReadDispositivo=di.getUrl()+p.getUrl()
						valorREST=self.getValueDispositivo(urlReadDispositivo)
						p.valor=valorREST
						if "returned null" in valorREST:
							raise urllib2.URLError(urlReadDispositivo)
							return False

					except urllib2.URLError as ex:
						print "No se ha podido acceder a "+urlReadDispositivo
						return False
			print "OK [Tiempo: "+str(time.time() - t0)+"]"
		return self.allDispositivos

print "Iniciando hilo..."
h=hiloEstadoDispositivos()
while (True):
	try:
		if h._comprobarConexion():
			if h.leerEstadosREST():
				h.actualizarDispositivos()
		else:
			break;
	except KeyboardInterrupt as ex:
		print "Se ha producido una interrupcion por teclado"
		break;

print "Parando hilo..."	
