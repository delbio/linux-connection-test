Connection Test
===============
Verifica che la connessione Wifi sia correttamente stabilita, in caso contrario controlla che sia stabilita quella ETH altrimenti tenta di ristabilire la connessione Wifi, in questo caso viene rieseguito un controllo dopo alcuni secondi.

	sudo sh ConnectionTest.sh > tmp.txt 2<&1

Per automatizzare il controllo ogni minuto, eseguire il seguente controllo:

	bash init_crontab.sh

questo comando inizializzerà un cronjob in sudo crontab inquanto i comandi ifup e ifdown richiedono il privilegio di super user


Nota: il codice per il test della connessione Wifi è preso dal seguente link:

http://www.emcu.it/RaspBerryPi/RaspBerryPi_UK.html#Control_the_status_of_the_WiFi
