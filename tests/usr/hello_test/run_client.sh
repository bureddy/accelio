#!/bin/bash

# Arguments Check
if [ $# -lt 2 ]; then
        echo "[$0] Missing Parameters!"
	echo "Usage: $0 Server-IP Port [0 for infinite run and 1 for finite. default is 0] [data_len. default=1024]"
        exit 1
fi

export LD_LIBRARY_PATH=../../../src/usr/

server_ip=$1
port=$2
if [ -z "$3" ]
then
	#running indefinitely
	finite_run="0"
else
	finite_run=$3
fi

core=1
ivec=0
ovec=1
hdrlen=0

if [ -z "$4" ]
then
	data_len="1024"
else
	data_len=$4
fi

./xio_client -c ${core} -p ${port} -n ${hdrlen} -w ${data_len} -l ${ovec} -g ${ivec} ${server_ip} -f ${finite_run}


