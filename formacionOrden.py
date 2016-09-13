# -*- coding: UTF-8 -*-
import Clases as cl
import constantesURL as K_url
import random, time, pprint
import unicodedata
import MySQLdb
import re, string
#Corpus
print "Cargando corpus de trabajo..."
from SpanishCorpus import SpanishCorpus

class formacionOrden:

#######################################################
#
#		ACCESO A LOS DISPOSITIVOS PARA ACTIVARLOS O NO
#
#######################################################
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
			nombreAux=re.sub(r'([a-z])([0-9])', r'\1 \2', dEN['disp_ombre'].lower())
			dispAux=cl.Dispositivo(nombreAux, dEN['d_id'], dEN['rHab'], dEN['servicio'], dEN['tipoDispositivo'], dEN['tipoComponente'], None)
			propDB=self.getPropiedadesDB(dEN['d_id'], tipoAcceso)

			for propEN in propDB:
				propAux=cl.Propiedad(propEN['nombre'], propEN['tipo'], propEN['acceso'], propEN['ultimoValor'])
				dispAux.addPropiedad(propAux)

			dispoEN.append(dispAux)

		self.dispositivos=dispoEN

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

#######################################################
#
#		DIFERENTES COMPROBACIONES PARA EL DIAGRAMA DE FLUJO DE TRABAJO
#
#######################################################

	def _quitarAcentos(self, input_str):
		input_str=input_str.decode('utf-8')
		s = ''.join((c for c in unicodedata.normalize('NFD',unicode(input_str)) if unicodedata.category(c) != 'Mn'))
		return s.decode()

	def _esAyuda(self):
		for cmd in K_url.cmd_EMERGENCIA:
			if self.tokensUnificados == cmd:
				return True
		return False

	def _esInicio(self):
		for cmd in K_url.cmd_INICIO:
			for t in self.corpus._tokens:
				if cmd == t:
					return t
		return False

	def _esParada(self):
		for cmd in K_url.cmd_PARADA:
			for t in self.corpus._tokens:
				if cmd == t:
					return t
		return False

	def _tienePersona(self):
		for item in K_url.LISTA_TELEFONOS:
			for t in self.corpus._tokens:
				if item[0].lower() == t or item[1].lower() == t:
					return item		
		return False

	def _tieneObjeto(self):
		for d in self.dispositivos:
			if d.nombre in self.text:
				return d
		return False

	def _tieneOrganizacion(self):
		for p in K_url.cmd_ORGANIZACION:
			for t in self.corpus._tokens:
				if p == t:
					return t
		return False

	def _fraseSubordinada(self):
		subordinada=self.text.split("que")
		if len(subordinada)>1:
			resultado=list()
			for s in subordinada:
				resultado.append(s)
			return str(resultado[1]).strip()
		else:
			return None

	def _accionDispositivo(self, dispositivo, accion):
		#Definimos si es CORTINA
		if dispositivo.servicio==2:
			if accion==0:
				accion=2

		for p in dispositivo.propiedades:
			if p.modo.upper()=="WRITE":
				p.valor=accion
				res="Acceder a: "+dispositivo.getUrl()+p.getWriteURL()
				K_url.urllib2.urlopen(dispositivo.getUrl()+p.getWriteURL())
			#elif p.modo.upper()=="READ":
			#	K_url.tts("El valor de "+dispositivo.nombre+" es "+p.valor)
		return res

	def _accionLlamar(self, itemPersona):
		if itemPersona:
			return "======> Llamando a "+itemPersona[0]+"("+itemPersona[1]+") ["+itemPersona[2]+"]"

	def DEBUG(self):
		print self.corpus._tokens

	def definirFrase(self):
		resBool=False
		esAy=self._esAyuda()
		esIni=self._esInicio()
		esPar=self._esParada()
		resultado=""
		resultado+='----------------------------------------\n'
		if esAy: #Comprobamos si la llamada que se ha hecho es de emergencia
			resultado+='## Llamando a emeregencias...\n'
			K_url.tts("Llamando a emergencias")
			resBool=True
		elif esIni: #Comprobamos si es comando de inicio
			resBool=True
			resultado+='## Iniciando acción:'+ str(esIni)+ '\n'
			esObj=self._tieneObjeto()
			esPers=self._tienePersona()
			esOrg=self._tieneOrganizacion()
			tieneSub=self._fraseSubordinada()
			if esObj:
				if esIni=="decir" or esIni=="dime":
					K_url.tts("El estado de "+str(esObj.nombre)+" es "+esObj.propiedades[0].estadoActual())
				else:
					K_url.tts(str(esIni)+" "+str(esObj.nombre))
					resultado+="#### "+ str(esObj.nombre)+" [dispositivo]\n"
					resultado+=self._accionDispositivo(esObj, 1)+"\n"
			elif esPers:
				K_url.tts(str(esPers)+" a " +str(esPers[1]))
				resultado+="####"+ str(esPers[1])+ " [persona]\n"
				resultado+=self._accionLlamar(esPers)+"\n"
			elif esOrg:
				K_url.tts("Contactar con " +str(esPers[1]))
				resultado+="####"+ str(esOrg)+ " [organización]\n"
			else:
				pass

			if tieneSub:
				resultado+="###### Objetivo: que "+ str(tieneSub)+"\n"

		elif esPar: #Comprobamos si es comando de parada
			resBool=True
			esObj=self._tieneObjeto()
			if esObj:
				K_url.tts(str(esPar)+" "+str(esObj.nombre))
				resultado+=self._accionDispositivo(esObj, 0)+"\n"
		else:
			resBool=False
			resultado+="Locución incorrecta\n"
		resultado+='----------------------------------------\n'
		print resultado
		return (resultado, resBool)

	def __init__(self, texto):
		self.getDispositivosEN("TODOS")
		self.text=self._quitarAcentos(texto)
		print "###"+self.text+"###"
		self.corpus = SpanishCorpus(self.text, timing=False)
		self.corpus.tokenize()
		self.corpus.clean()	
		self.corpus.filter_stop_words()
		self.corpus.analize(to_correct=False)
		self.corpus.clean_post_analysis()
		self.corpus.unify_tokens()
		self.tokensUnificados = self._quitarAcentos("_".join(self.corpus._tokens).encode('utf-8'))

#while True:
#	try:
#		text=raw_input("Escribe una frase: ")
#		a=formacionOrden(text)
#		a.definirFrase()
#	except KeyboardInterrupt:
#		print "\nSaliendo del programa..."
#		exit()