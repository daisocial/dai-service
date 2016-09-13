#!/usr/bin/env python3
import speech_recognition as sr
import time
import constantesURL as K_url
import formacionOrden as f_o
UMBRAL_DB=5.0
NOMBRE_ROBOT=["fermin", "robot"]
TIEMPO_ESPERA=5

def haySonido():
	#Espera hasta que haya sonido
	return True

def reconocer1():
	r = sr.Recognizer()
	with sr.Microphone() as source:
	    audio = r.listen(source)
	try:
		locucion=r.recognize_google(audio)
		return locucion.lower()
	except sr.UnknownValueError:
	    print("No te he entendido")
	    return None
	except sr.RequestError as e:
	    print("No se encuentra el servicio  Google speech_recognition. Error: {0}".format(e))
	    return None

def reconocer(s):
	if s==1:
		return "fermin"
	elif s==2:
		return "sube la persiana blind 1"


#while(True):
print "Escuchando ambiente"
haySonido()
comandoInicio=reconocer(1)
if comandoInicio in NOMBRE_ROBOT:
	adios=True
	K_url.tts("Te escucho")
	tiempoInicio = time.time()
	while (time.time() - tiempoInicio) < TIEMPO_ESPERA:
		grabacionOrden=reconocer(2)
		print "He recibido\""+grabacionOrden+"\""
		orden=f_o.formacionOrden(grabacionOrden)
		locucion=orden.definirFrase()
		if locucion[1]:
			K_url.tts("Accionando dispostivo <<blind 1>>")
			adios=False
			break
		else:
			K_url.tts("Lo siento, no te he entendido")

	if adios:
		K_url.tts("Adios")