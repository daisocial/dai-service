ls
sudo service smbd
sudo service samba
sudo service --status-all
sudo apt-get update
sudo apt-get upgrade
sudo service --status-all
sudo reboot
sudo apt-get install apache2 php5-mysql mysql-common mysql-server php
sudo apt-get install apache2 php5-mysql mysql-common mysql-server -y
cd ../../../
su root
sudo passwd root
cd etc
ls
cd samba/
la
ls
sudo nano smb.conf
sudo service samba restart
sudo service --status-all
sudo apt-get install samba samba-common-bin
sudo service --status-all
sudo nano smb.conf 
sudo service smbd restart
sudo service nmbd restart
cd
sudo smbpasswd -a pi
cd ../../
cd etc/samba/
sudo nano smb.conf 
cd
sudo service smbd restart
sudo service nmbd restart
cd ../../
chmod var/www 777
chmod 777 var/www
sudo chmod 777 var/www -r
su root
ls
cd home/
ls
cdp i
cd pi
ls
sudo apt-get install python-dev
ls
python hiloEstadoDispositivos.py 
sudo apt-search cache python | grep sql
sudo apt-cache search python | grep sql
sudo apt-cache search python | grep mysql
sudo apt-get install python-mysqldb -y
python hiloEstadoDispositivos.py 
sudo mysql -u root -praspberry
python hiloEstadoDispositivos.py 
python hiloAdquirirDispositivos.py 
sudo mysql -u root -praspberry
python hiloAdquirirDispositivos.py 
sudo mysql -u root -praspberry
python hiloAdquirirDispositivos.py 
sudo mysql -u root -praspberry
ls
python hiloControlVoz.py 
pip install http-parser
sudo apt-get install python-dev 
sudo apt-cache search
sudo apt-cache search python | grep utils
python -p pip install -U pip
python -m pip install -U pip
sudo apt-get install python-pip
python hiloControlVoz.py 
pip install http-parser
sudo pip install http-parser
python hiloControlVoz.py 
python asr1.py 
ls
python asr1.py 
python hiloControlVoz.py 
sudo service apache2 restart
sudo apt-get install php5
sudo sudo apt-get install php5
ping google.es
sudo apt-get install php5 libapache2-mod-php5 -y
sudo apt-get update
sudo apt-get install php5 libapache2-mod-php5 -y
sudo service apache2 restart
sudo mysql -u root -p
sudo service apache2 restart
sudo mysql -u root -p
ls
cd ../../
cd www
cd var/www
ls
cd html
ls
git init
sudo apt-get install git
git init
git config user.name
git config user.name "Juanjo Conejero"
git --status
git config --global user.name "Juanjo Conejero"
git config --global user.email "contacto@juanjoconejero.com"
git config --list
git remote add github https://github.com/mrcone/DAISocial-webserver.git
git add *
git commit -m "Version 2.0"
git push 
git push github
git push -u github master
git push -u github master -f
cd ../../
cd ../
cd home/pi/
ls
git init
git commit -m "Version 1.0"
git *
git add *
git commit -m "Version 1.0"
git remote add github https://github.com/mrcone/DAISocial-service.git
git push -u github master
python hiloAdquirirDispositivos.py 
python hiloEstadoDispositivos.py 
python hiloAdquirirDispositivos.py 
python hiloEstadoDispositivos.py 
exit
sudo mysql -u root -praspberry
ls
git add *
git commit -m "Adquirir y Estado arreglados"
git push -u github master
CD ../
cd ../../../
cd var/www
cd html/
git add *
git commit -m "Timer de jquery correcto, BeautifulNombre extendido a todos los dispositivos"
git push -u github master
cd
ls
mysqldump -u root -p db_tfg2 > db_backup.sql
ls
git add db_backup.sql 
git commit -m "Backup base de datos"
git push -u github master
exit
ls
ifconfig
cd ../../
cd etc/wpa_supplicant/
sudo nano wpa_supplicant.conf 
cd ../
ls
scp
ls
cd ssl
cd cert
ls
cd certs/
sudo scp 169.254.37.65:/inal16.der inal16.der
sudo scp 169.254.37.65:\inal16.der inal16.der
cd ../../
cd etc/ssl/certs/
sudo cp ../../../home/pi/inal16.der inal16.der
sudo service networking restart
sudo service --status-all
ifconfig
sudo reboot
iwconfig
ifconfig wlan0
ping google.es
ping ua.es
ping www.ua.es
sudo apt-get update
python ASRParser.py 
sudo pip install nltk
ifconfig
ifconfig wlan0
sudo service networking restart
ifconfig wlan0
nano ../../../etc/wpa_supplicant/wpa_supplicant.conf 
sudo nano ../../../etc/wpa_supplicant/wpa_supplicant.conf 
ifconfig wlan0
sudo reboot
ifconfig wlan0
sudo apt-get update
ifconfig wlan0
sudo service networking restart
sudo systemctl daemon-reload
ifconfig wlan0
sudo service networking restart
ifconfig wlan0
sudo nano ../../../etc/wpa_supplicant/wpa_supplicant.conf 
wpa_gui
sudo service networking restart
ifconfig wlan0
cd ../
ls
wget https://cat.eduroam.org/user/API.php?action=downloadInstaller&lang=es&id=linux&profile=24
cd pi/
sudo sh eduroam-linux-UdA-eduroam.sh 
sudo reboot
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ifconfig
ifconfig
ls
git add *
git status
cd ../../
cd var/www/html/
git add *
ls
git status
git status master
git commit -a
git git sho
git show
ls
cd SpanishCorpus-master/
python main.py 
cd ../
ls
python formacionOrden.py 
python
python formacionOrden.py 
sudo apt-get install bluez
hciconfig
sudo hciconfig hci0 scan
sudo hciconfig hci0 piscan
sudo bluetooth-agent 1234
sudo hciconfig --help
caveats
sudo apt-get install pi-bluetooth
sudo apt-get install bluez bluez-firmware -y
sudo apt-get install blueman -y
sudo apt-get install blueman -force-yes
sudo apt-get install blueman --force-yes
sudo apt-get update
bluetoothctl
bluetoothctl -a
sudo bluetoothctl -a
sudo apt-get install pulseaudio pulseaudio-module-bluetooth pavucontrol
ls
sudo bluetoothctl -a
sudo apt-get install mplayer2
ls
mplayer audio.mp3 
sudo pulseaudio --start
pulseaudio --start
mplayer audio.mp3 
sudo bluetoothctl -a
pulseaudio --start
mplayer audio.mp3 
pulseaudio --help
pulseaudio -k
pulseaudio -k --start
sudo alsa force-reload
mplayer audio.mp3 
sudo mplayer audio.mp3 
arecord
arecord --list
arecord --list-devices
arecord -D
arecord -help
start alsamixer
alsamixer
alsamixer --help
alsamixer
ls
rm -rf WhatsApp/
ls
nano SpanishCorpus.py
pi@raspberrypi:~ $
ls
lusb
lsusb
arecord
pulseaudio
omxplayer
arecord a.wav -D sysdefault:CARD=1
sudo arecord a.wav -D sysdefault:CARD=1
sudo arecord a.wav -D sysdefault:CARD=2
sudo arecord a.wav -D sysdefault:CARD=3
sudo arecord a.wav -D sysdefault:CARD=1
ls
mplayer a.wav 
mplayer audio.mp3 
mplayer a.wav 
alsamixer 
mplayer a.wav 
sudo arecord a.wav -D sysdefault:CARD=
mplayer a.wav 
arecord --help
arecord -l
mplayer a.wav 
ls
exit
ls
python grabar.py 
nano grabar.py 
python grabar.py 
sudo pip install pyaudio
sudo pip upgrade
sudo pip help
sudo pip search pyaudio
sudo pip search PyAudio
sudo pip install PyAudio
sudo apt-get install portaudio19-dev -y
sudo pip install PyAudio
python grabar.py 
sudo python grabar.py 
aplay -L
sudo python grabar.py  -L
sudo python grabar.py
pulseaudio --start
sudo python grabar.py
alsamixer -c 0
sudo python grabar.py
sudo nano ../../etc/pulse/client.conf 
pulseaudio --restart
pulseaudio --kill
pulseaudio --start
sudo python grabar.py
sudo nano ../../etc/pulse/client.conf 
pulseaudio --kill
pulseaudio --start
sudo ls ../../etc/pulse/
sudo nano ../../etc/pulse/default.pa 
alsamixer
arecord -D plyghw:1,0 test-wav
sudo arecord -D plyghw:1,0 test-wav
sudo arecord -D plughw:1,0 test-wav
sudo arecord -D plughw:1,0 test.wav
sudo arecord -D plughw:1,1 test-wav
sudo arecord --help
sudo arecord --L
sudo arecord -L
sudo arecord -D plughw:0,0 test-wav
sudo arecord test-wav
sudo arecord -D plughw:1,0 test-wav
sudo arecord -D plughw:1,0 test.wav
sudo arecord a.wav -D sysdefault:CARD=1
python grabar.py 
sudo python grabar.py 
exit
ls
ifconfig
cd ../../
cd etc/modprobe.d/
ls
cd ../../
cat proc/asound/card
cat proc/asound/cards
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install bison libasound2-dev swig
sudo reboot
cd ../../
cd etc
ls
ls --recursive | grep asound
sudo ls --recursive | grep asound
sudo ls ../ --recursive | grep asound
sudo ls ../ --recursive | grep asound.conf
grep --help
sudo ls ../ --recursive | grep asound.conf -H
sudo ls ../ --recursive
sudo ls ../ --recursive | grep asound.conf -HL
sudo ls ../ --recursive | grep asound.conf -H
sudo find . "asound.conf"
sudo find "asound.conf" ./
sudo find "asound.conf" ./ -H
sudo apt-get install mplayer
sudo apt-get install python-dev
grep -Ril "pcm.usb" /
amixer -c 0
amixer -c 0 sget
amixer -c 0 sget 'PCM'
amixer -c 0 sget 'PCM',0
amixer -c 1
amixer -c 0
amixer -c 1
cd
record -D plughw:0,0 -f cd test.wav 
arecord -D plughw:0,0 -f cd test.wav 
sudo arecord -D plughw:0,0 -f cd test.wav 
sudo arecord -D plughw:1,0 -f cd test.wav 
ls
aplay test.wav 
sudo pip install pyaudio
python
sudo pip install SpeechRecognition
python -m speechrecognition
python -m speech_recognition
sudo python -m speech_recognition
ls -a
cd ../
ls -a
cd ../
ls etc A
ls etc -a
ls etc --all
sudo python -m speech_recognition
cd etc/
ls
ls -a | grep asound
ls -ar | grep asound
ls -r | grep asound
ls -r ./ | grep asound
ls --recursive ./ | grep asound
sudo ls --recursive ../ | grep asound
ls --help
sudo ls --recursive -l ../ | grep asound
ls ../
cd root
ls ../root/
sudo ls ../root/
sudo ls ../root
sudo find / asound
sudo find / "asound"
find --help
ls -lAFGR --si | grep asound
sudo ls -lAFGR --si | grep asound
sudo ls -lAFGR | grep asound
sudo ls -lAFGR ../ | grep asound
ls
cd ../
ls
ls -a
cd root
su root
ls
cd usr/share/
ls
cd alsa
sudo nano alsa.conf
cd
ls
cd ../
ls
cd pi
mkdir -m 755 .asoundrc
rm -rf .asoundrc/
touch .asoundrc
sudo nano .asoundrc 
python -m speech_recognition
sudo nano .asoundrc 
sudo reboot
ls
python -m speech_recognition
sudo python -m speech_recognition
amixer
amixer --help
amixer -D
amixer -c 1
amixer -c 0
sudo arecord -D plughw:1,0 -f cd test.wav 
amixer -c 1
sudo nano .asoundrc 
sudo python -m speech_recognition
python -m speech_recognition
python
ls
python grabar.py 
cd ../../
cd usr/share/alsa/
sudo nano alsa.conf
cd
cd ../../
cd etc/
sudo touch asound.conf
sudo nano asound.conf 
amixer
cat ../proc/asound/cards
sudo nano asound.conf 
cd
python grabar.py 
sudo reboot
ls
python grabar.py 
cd ../../etc/
nano asound.conf 
ls
python formacionOrden.py
python acentosBORRAR.py 
python formacionOrden.py
python grabar.py 
cd ../../
cd usr/share/
ls
cd alsa
ls
cp alsa.conf alsa.conf.bak
sudo cp alsa.conf alsa.conf.bak
ls
sudo nano alsa.conf
sudo apt-get --no-install-recommends install jackd2
cd
ls
jackd -d alsa
sudo jackd -d alsa
sudo reboot
ls
python grabar.py 
pulseaudio --help
pulseaudio --start
sudo pulseaudio --start
pulseaudio --start
python grabar.py 
pulseaudio -D
pulseaudio --kill
pulseaudio -D
ls -a
ls .asoundrc 
ls .asoundrc
ls .asoundrc/
ls .asoundrc
sudo nano .asoundrc 
pulseaudio -D
cd ../../../
cd etc/pulse/
ls
ls -a
sudo nano daemon.conf 
cd
ls
python grabar.py 
sudo python grabar.py 
jackd -d alsa
python grabar.py 
sudo adduser pi audio
python grabar.py 
python grabar.py > log.log
lusb
lsusb
cd ../../
car proc/asound/cards
car proc/asound/card
cat proc/asound/cards
lsusb
lsusb -v
lsusb -v | less
lsusb -v
ls etc/modprobe.d/
usb-devices
cd usr/share/alsa/
ls
cd ../../
cd ../
cd etc/modprobe.d/alsa
cd etc/modprobe.d/
ls
cd
cd ../../../usr/share/alsa/
sudo nano alsa.conf
cd
python grabar.py 
speaker-test
sudo speaker-test
pg pulse
pulseaudio -D --log-target=syslog
python grabar.py 
aplay -l
arecord a.wav -D sysdefault:CARD-1
arecord a.wav -D sysdefault:CARD=1
sudo arecord -D plughw:1,0 test.wav
volumeicon
sudo arecord -D plughw:1,0 test.wavsudo arecord -D plughw:1,0 test.wav
python grabar.py 
jack_control start
sudo jack_control start
jackd -d alsa
ls
cd etc
cd ../../
cd etc
sudo nano asound.conf 
sudo cp asound.conf asound.conf.bak
sudo nano asound.conf
sudo reboot
python grabar.py 
cd ../../
car proc/asound/cards
cat proc/asound/cards
sudo cp usr/share/alsa/alsa.conf etc/modprobe.d/alsa-base.conf
sudo nano etc/modprobe.d/alsa-base.conf 
sudo rm etc/modprobe.d/alsa-base.conf 
ls
cd etc/
cd ../
cd usr/
cd share/
l
ls
cd alsa
ls
sudo nano pulse-alsa.conf 
ls alsa.conf.d
nano alsa.conf.d/pulse.conf 
sudo nano alsa.conf
cd cards
ls
sudo nano aliases.
sudo nano aliases.conf 
ls
cd ../
ls
sudo nano alsa.conf
cd ../../../
cd usr/share/alsa/
ls
sudo nano cards/aliases.conf 
sudo nano alsa.conf
ls
sudo reboot
ls
python grabar.py 
valgrind python grabar.py 
sudo apt-get install valgrind
valgrind python grabar.py 
python grabar.py 
cd ../../
ls
cd usr/
cd share/
ls
cd alsa
ls
sudo nano pulse-alsa.conf 
ls
sudo nano alsa.conf
cd pcm
ls
cd ../../
cd etc
ls
rm asound.conf
sudo rm asound.conf
cp asound.conf.bak asound.conf
sudo cp asound.conf.bak asound.conf
cd
sudo reboot
ls
python grabar.py 
cd ../../
cd usr/share/
ls
cd alsa
ls
sudo nano alsa.conf
cd ../
cd alsa
car cards/
cat cards/
cd
cat ../../proc/asound/cards
sudo reboot
ls
python grabar.py 
aplayer -L
aplay -L
lsusb
sudo nano ../../etc/alsa/alsa.conf
sudo nano ../../usr/share/alsa/alsa.conf
amixer
sudo amixer
sudo apt-purge alsa*
sudo apt-get purge alsa*
sudo apt-get purge alsa-*
amixer
amixer -c 0
cd ../../
cd lib/
ls
cd modprobe.d/
ls
sudo nano aliases.conf 
sudo reboot
ls
python grabar.py 
alsamixer -c 0
alsamixer -c 1
alsamixer
alsactl init
lsmod
lsusb
pulseaudio --kill
jack_control start
sudo jack_control start
pulseaudio --start
python grabar.py 
cat /proc/asound/cards
ls
cd ../../../lib/modprobe.d/
sudo nano aliases.conf 
sudo reboot
ls
python grabar.py 
alsamixer
alsamixer -c 0
amixer
amixer -c 0
amixer -c 1
cat /proc/asound/cards
sudo nano /etc/asound.conf
amixer -c 0 sget 'Mic',0
amixer -c 1 sget 'Mic',0
arecord -D plughw:0,0 -f cd test.wav
sudo arecord -D plughw:0,0 -f cd test.wav
sudo arecord -D plughw:0,1 -f cd test.wav
sudo arecord -D plughw:1,0 -f cd test.wav
python grabar.py 
python formacionOrden.py
python
python formacionOrden.py
python
python formacionOrden.py
ls
rm acentosBORRAR.py 
ls
rm *.pyc
ls
git add *
git commit -m "Salvado dddiario"
git push
ls
python formacionOrden.py 
mysql -u root -praspberry
ifconfig
python formacionOrden.py 
git add -A
git commit -m "formacionOrden finalizado"
git push
git status
git show
git show formacionOrden.py
ls
python hiloControlVoz.py 
python
python hiloControlVoz.py 
nmap localhost
fuser -k 8888/tcp
nmap localhost
python hiloControlVoz.py 
git add *
git commit -m "Servidor socket en marcha, con formacion de ordenes"
git push
python formacionOrden.py
git show formacionOrden.py
python formacionOrden.py
git add *
git commit -m "Seguims con el control vocal"
git push
cd ../../
cd var/www
ls
cd html/
git add *
git commit -m "Vinculado con servidor ASR y funcionando"
git push
cd
ls
python formacionOrden.py
ifconfig
ls
python controlVoz_server.py 
ls
python hiloAdquirirDispositivos.py 
python hiloEstadoDispositivos.py 
ls
python hiloAdquirirDispositivos.py 
python hiloEstadoDispositivos.py 
ssh dai@10.41.1.3
ls
python controlVoz_server.py 
python hiloEstadoDispositivos.py 
python hiloAdquirirDispositivos.py 
python tiempoTTS.py 
python hiloEstadoDispositivos.py 
ls
git add *
git commit -m "Ya no queda na!"
git push
exit
python clienteASR.py 
ls
python controlVoz_server.py 
ifconfig
python clienteASR.py 
python procesarCorpus.py 
python 
python procesarCorpus.py 
python controlVoz_server.py 
lsit
list
ps
pstree
ps aux | less
python hiloEstadoDispositivos.py 
ping http://shanon.iuii.ua.es
ping shanon.iuii.ua.es
python hiloEstadoDispositivos.py 
ifconfig
ls
python formacionOrden.py 
mysql -u root -praspberry
python formacionOrden.py 
python hiloEstadoDispositivos.py &
ls
python hiloEstadoDispositivos.py 
ls
python hiloEstadoDispositivos.py 
exit
python controlVoz_server.py 
exit
ifconfig
cd ../../../
cd etc/network/
ls
sudo nano interfaces
cd ../
cd wpa_supplicant/
ls
sudo nano wpa_supplicant.conf 
sudo reboot
ifconfig
python hiloEstadoDispositivos.py 
