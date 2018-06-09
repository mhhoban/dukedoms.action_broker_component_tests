#!/bin/bash

./oas_setup.sh
SERVICE=action_broker_component_tests
docker build --build-arg service=$SERVICE \
--tag "mhhoban/dukedoms-action-broker-tests:latest" .
