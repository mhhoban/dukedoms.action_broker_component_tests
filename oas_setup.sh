#!/bin/bash

#fetch card broker API Spec

curl https://raw.githubusercontent.com/mhhoban/dukedoms.action_broker_api/master/dukedoms_action_broker_api.yaml -O
mv dukedoms_action_broker_api.yaml action_broker_component_tests/specs/dukedoms_action_broker_api.yaml
