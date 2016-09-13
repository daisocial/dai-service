import constantesURL as K_url

class Propiedad:
	def __init__(self, nom, t, acc, va):
		self.nombre=nom
		self.tipo=t
		self.modo=acc
		self.valor=va
		#self.ultimoacceso=ultimoacc
	def __str__(self):
		cadena="--"+self.nombre+" ("+self.modo+")--: \t"+str(self.valor)+"\n"
		return cadena

	def estadoActual(self):
		if self.valor==0 or self.valor==False or self.valor=="false":
			return "desactivado"
		if self.valor==1 or self.valor==True or self.valor=="true":
			return "activado"

	def getUrl(self):
		if self.modo.upper() == "READ":
			return self.getReadURL()
		elif self.modo.upper() == "WRITE":
			return self.getWriteURL()
		else:
			return "--"

	def getReadURL(self):
		return K_url.propREAD.replace("{prop}", str(self.nombre))

	def getWriteURL(self):
		return K_url.propWRITE.replace("{prop}", str(self.nombre)).replace("{value}", str(self.valor))

class Habitacion:
	def __init__(self, nom, i=-1):
		self.nombre=nom
		self.id=i

class ExcepcionAISOY(Exception):
	def __init__(self, msg, expr=None):
		self.expr = expr
		self.msg = msg

	def __str__(self):
		return self.msg			

class Servicio:
	def __init__(self, serv, i=-1):
		self.nombre=serv
		self.id=i		

class Dispositivo:

	def __init__(self, no, i, habita, serv, tipoDisposi, tipoCompon, propied):
		self.nombre=no
		self.identificador=i
		self.habitacion=habita
		self.servicio=serv
		if isinstance(propied, list):
			self.propiedades=propied
		else:
			self.propiedades=list()
		self.tipoDispositivo=tipoDisposi
		self.tipoComponente=tipoCompon

	def addPropiedad(self, prop):
		self.propiedades.append(prop)

	def __str__(self):
		cadena="#"+self.nombre+" ("+str(self.identificador)+")#:"
		cadena+="\n\t\tTipo Dispositivo: "+self.tipoDispositivo+"\n\t\tTipo Componente: "+self.tipoComponente
		cadena+="\n\t\tHabitacion: "+str(self.habitacion)+"\n\t\tServicio:"+str(self.servicio)
		cadena+="\n\t\tPropiedades: "
		for p in self.propiedades:
			cadena+=str(p)

		return cadena

	def getUrl(self):
		return K_url.deviceIO.replace("{disp}", str(self.identificador))


