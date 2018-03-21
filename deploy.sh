#!/bin/bash
echo "==> Building the application"
bower install && npm install
polymer build

export APP_NAME=scavenger-hunt-game
echo "==> Creating build and pushing bits"
oc new-build --binary --name=${APP_NAME} -l app=${APP_NAME}
oc start-build ${APP_NAME} --from-dir=. --follow

echo "==> Creating deployment config, service and route"
oc apply -f openshift/deployment.yaml
oc apply -f openshift/service.yaml
oc apply -f openshift/route.yaml
