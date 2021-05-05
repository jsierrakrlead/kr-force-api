PIDFILE='/home/ubuntu/apps/kr-force-api/shared/tmp/pids/puma.pid'
SOCKFILE='/home/ubuntu/apps/kr-force-api/shared/tmp/sockets/puma.sock'

if [ -f $PIDFILE ]; then
  echo "PIDFILE exists. Killing..."
  kill -9 `cat ${PIDFILE}`
fi

if [ -f $SOCKFILE ]; then
  echo "SOCKFILE exists. Deleting..."
  rm $SOCKFILE
fi

exit 0