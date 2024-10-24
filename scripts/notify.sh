#!/bin/bash

# Determinar el estado del workflow
STATUS=$1

# Notificación a Slack
if [ -n "$SLACK_WEBHOOK_URL" ]; then
  curl -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"El workflow ha finalizado con estado: $STATUS.\"}" \
  "$SLACK_WEBHOOK_URL"
fi

# Notificación por correo electrónico
if [ -n "$SENDGRID_API_KEY" ] && [ -n "$NOTIFICATION_EMAIL" ]; then
  curl --request POST \
    --url https://api.sendgrid.com/v3/mail/send \
    --header "Authorization: Bearer $SENDGRID_API_KEY" \
    --header 'Content-Type: application/json' \
    --data '{
      "personalizations": [
        {
          "to": [
            {
              "email": "'"$NOTIFICATION_EMAIL"'"
            }
          ],
          "subject": "Notificación de CircleCI - '$STATUS'"
        }
      ],
      "from": {
        "email": "'"$NOTIFICATION_EMAIL"'"
      },
      "content": [
        {
          "type": "text/plain",
          "value": "El workflow ha finalizado con estado: '$STATUS'."
        }
      ]
    }'
fi
