#!/usr/bin/env bash

APP_DEPLOYMENT=
WORKER_DEPLOYMENT=
TAG= # $(echo $CI_COMMIT_ID | cut -c1-8)$(echo "-prod")

kubectl set image deployment/$WORKER_DEPLOYMENT django-worker=django-worker:$TAG
kubectl rollout status deployment $WORKER_DEPLOYMENT

kubectl set image deployment/$APP_DEPLOYMENT django-app=django=app:$TAG
kubectl rollout status deployment $APP_DEPLOYMENT
