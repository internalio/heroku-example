#!/bin/bash

echo "Choose a name for your project:"
read projectName

set -eux

# Update heroku to beta
heroku update beta

# Install manifest plugin
heroku plugins:install @heroku-cli/plugin-manifest

# Set config variables
apiSecret=$(openssl rand -base64 40 | tr -d /=+ | cut -c -50)
connectorSecret=$(openssl rand -hex 32)
domain=$(heroku domains | tail +2 | cut -d# -f2)

heroku stack:set --app $projectName container
heroku config:set --app $projectName \
  INTERNALIO_SECRET_KEY=$apiSecret \
  INTERNALIO_CONNECTOR_SECRET_KEY=$connectorSecret \
  INTERNALIO_BASE_URI="https://${domain}" \
  INTERNALIO_DOMAIN=$domain


# Push image to heroku
git push heroku master

set +eux

echo "!!!! IMPORTANT !!!!"
echo "Ensure that the following environment variables are stored and backed up safely to ensure persistent access to your data."
echo "INTERNALIO_SECRET_KEY=${apiSecret}"
echo "INTERNALIO_CONNECTOR_SECRET_KEY=${connectorSecret}"
