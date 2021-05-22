#!/bin/bash

export TOMCAT_DIR=/opt/tomcat

if [ -z "$TIMEZONE" ]; then
	echo "···································································································"
	echo "VARIABLE TIMEZONE NO SETEADA - INICIANDO CON VALORES POR DEFECTO"
	echo "POSIBLES VALORES: America/Montevideo | America/El_Salvador"
	echo "···································································································"
else
	echo "···································································································"
	echo "TIMEZONE SETEADO ENCONTRADO: " $TIMEZONE
	echo "···································································································"
	cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime && \
	echo $TIMEZONE > /etc/timezone
fi

export JAVA_OPTS="$JAVA_OPTS -XX:MaxRAMFraction=1 -XX:+UnlockExperimentalVMOptions -Dfile.encoding=UTF8 -XX:+ExitOnOutOfMemoryError -Djava.net.preferIPv4Stack=true"

if [ ! -z "$CUSTOM_JAVA_OPTS" ]; then
	echo "···································································································"
	echo "JAVA_OPTS ENCONTRADO"
	export  JAVA_OPTS="$JAVA_OPTS $CUSTOM_JAVA_OPTS"
	echo "···································································································"
fi

	echo "···································································································"
	echo "INICIANDO APP..."
	echo "···································································································"

exec $TOMCAT_DIR/bin/catalina.sh run

