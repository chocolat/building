#!/usr/bin/env bash

# JAVASCRIPT_NODE_RUN_ARGUMENTS must be an array
# For example: JAVASCRIPT_NODE_RUN_ARGUMENTS=('--random-seed' '123' '--strict' 'true')

node debug "$CHOC_FILE" "${JAVASCRIPT_NODE_RUN_ARGUMENTS[@]}"
