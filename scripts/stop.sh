#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE="$PROJECT_ROOT/springboot-app.jar"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/application.log"
DEPLOY_LOG="$PROJECT_ROOT/application.log"

TIME_NOW=$(date +%c)

CURRENT_PID=$(pgrep -f $JAR_FILE)

if [ -z $CURRENT_PID ]; then
	echo "$TIME_NOW : no process" >> $DEPLOY_LOG
else
	echo "$TIME_NOW : stop PID $CURRENT_PID" >> $DEPLOY_LOG
	kill -15 $CURRENT_PID
fi
