#!/bin/bash

# Heroku specific environment variables
export INTERNALIO_API_DATABASE_URI=$INTERNALIO_API_DATABASE_URL
export INTERNALIO_CONNECTOR_DATABASE_URI=$INTERNALIO_CONNECTOR_DATABASE_URL

echo "Migrating databases... (this may take 1-2 minutes)"

# Migrate api
export INTERNALIO_SECRET_KEY=secret
export DJANGO_SETTINGS_MODULE=console.settings.onprem

cd /srv/internalio/api/ && pipenv run python manage.py migrate

# Migrate connector
/usr/lib/postgresql/12/bin/psql $INTERNALIO_CONNECTOR_DATABASE_URI -f /srv/internalio/connector/schema.sql
