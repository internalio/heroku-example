#!/bin/bash

# Heroku specific environment variables
export INTERNALIO_API_DATABASE_URI=$INTERNALIO_API_DATABASE_URL
export INTERNALIO_CONNECTOR_DATABASE_URI=$INTERNALIO_CONNECTOR_DATABASE_URL

/usr/local/bin/internalio
