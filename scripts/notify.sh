#!/bin/bash

# Determinar el estado del workflow
STATUS=$1

# Notificación a Slack
if [ -n "$SLACK_WEBHOOK_URL" ]; then
  curl -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"El workflow ha finalizado con estado: $STATUS.\"}" \
  "$SLACK_WEBHOOK_URL"
fi