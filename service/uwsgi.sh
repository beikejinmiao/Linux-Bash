#!/bin/bash
######################################################################################
#File Name      : uwsgi.sh
#Author         : Li Jinmiao
#Mail           : beikejinmiao@gmail.com
#Created Time   : 2015-10-30 00:06:24
#Description    : manage the service of "uwsgi" 
######################################################################################

INIDIR=/etc/uwsgi/vassals
NAME=uwsgi
DAEMON=/usr/local/bin/uwsgi
PROJECT1=logistics
PIDFILE_LOGISTICS=/run/uwsgi/${PROJECT1}.pid

start() {
    echo "starting uwsgi..."
    if [ -e "${PIDFILE_LOGISTICS}" ]; then
        echo "uwsgi start failed: uwsgi have started"; 
        return
    fi

    #/usr/local/bin/uwsgi --emperor /etc/uwsgi/vassals 1>/dev/null 2>&1 &
    ${DAEMON} --ini ${INIDIR}/${PROJECT1}.ini
}

stop() {
    echo "stopping uwsgi..."
    if [ ! -e "${PIDFILE_LOGISTICS}" ]; then
        echo "uwsgi stop failed: uwsgi have not started"; 
        return
    fi

    #kill -INT `cat $PIDFILE_LOGISTICS`
    pid=`cat ${PIDFILE_LOGISTICS}`
    kill -9 ${pid}
    rm -f "${PIDFILE_LOGISTICS}"
}

restart() {
    echo "stoping uwsgi..."
    if [ -e "${PIDFILE_LOGISTICS}" ]; then
        #kill -INT `cat $PIDFILE_LOGISTICS` ##not work
        pid=`cat ${PIDFILE_LOGISTICS}`
        # kill the master process
        # can not use the 'pkill' or 'killall'
        # otherwise terminate the execute of script
        kill -9 $pid
        rm -f "${PIDFILE_LOGISTICS}"
    else
        echo "uwsgi stop failed: uwsgi have not started"
    fi

    sleep 1
    echo "starting uwsgi..."    
    #/usr/local/bin/uwsgi --emperor /etc/uwsgi/vassals 1>/dev/null 2>&1 &
    ${DAEMON} --ini ${INIDIR}/${PROJECT1}.ini
}

reload() {
    echo "reloading uwsgi..."
    if [ ! -e "${PIDFILE_LOGISTICS}" ]; then
       echo "uwsgi reload failed: uwsgi have not started"; 
       return
    fi

    kill -HUP `cat $PIDFILE_LOGISTICS`
}

# See how we were called.
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    reload)
        reload
        ;;
    *)
        echo $"Usage: serivce $name {start|stop|restart|reload}"
esac 
