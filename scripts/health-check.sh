#!/bin/bash

SERVER_IP=$1

curl -f http://$SERVER_IP

if [ $? -ne 0 ]; then
    echo "Health check failed"
    exit 1
fi

echo "Health check passed"