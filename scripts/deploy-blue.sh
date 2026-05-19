#!/bin/bash

APP_NAME=cicd-app-1.0.jar
DEPLOY_DIR=/opt/cicd-app

echo "Deploying to BLUE environment"

scp target/$APP_NAME ubuntu@$BLUE_SERVER_IP:$DEPLOY_DIR/

ssh ubuntu@$BLUE_SERVER_IP << EOF

pkill -f $APP_NAME

nohup java -jar $DEPLOY_DIR/$APP_NAME > app.log 2>&1 &

EOF

echo "Blue deployment completed"