#!/bin/bash
#####################################################################################
#File Name      : tomcat.sh
#Author         : Li Jinmiao
#Mail           : beikejinmiao@gmail.com
#Created Time   : 2015-09-27 17:22:26
#Description    : manage the serivce of 'tomcat' 
#####################################################################################

TOMCAT_HOME="/opt/DiaoDuOld"
RETVAL=0
SCRIPT_NAME="service tomcat"

start(){
    echo "start tomcat..."
    sh $TOMCAT_HOME/bin/startup.sh
    RETVAL=$?
    return $RETVAL
}

stop(){
    echo "stop tomcat..."
    sh $TOMCAT_HOME/bin/shutdown.sh
    RETVAL=$?
}


case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop

        sleep 2
        start
        ;;
    *)
        echo "Usage: $SCRIPT_NAME {start|stop|restart}"
        exit 1
esac


exit $RETVAL
