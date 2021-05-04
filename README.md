# heroku-example

An example deployment of Internal OnPrem using Heroku

## Prerequisites

- Heroku CLI

Install the Standalone Heroku CLI using the command below:
```
curl https://cli-assets.heroku.com/install.sh | sh
```
- Heroku CLI beta branch

This deployment makes use of the Heroku manifest addon and requires the beta version of the Heroku CLI.
```
heroku update beta
```
- Heroku Manifest Plugin

In order to deploy the Internal OnPrem project, the manifest addon must be installed.
```
heroku plugins:install @heroku-cli/plugin-manifest
```

## Installation

1. Confirm that you are running the *beta* version of Heroku CLI:
```
$ heroku -v
heroku/7.53.0-beta.4ef8f36 ...
```
2. Run the installation script:

This will create a new project called `internalio` and deploy Internal OnPrem.
```
./install.sh
```

**Important**

Once the installation script finishes, it will output generated secrets used for encrypting your data. Ensure that you store and backup these environment variables:

```
$ ./install.sh
...
!!!! IMPORTANT !!!!
Ensure that the following environment variables are stored and backed up safely to ensure persistent access to your data.
INTERNALIO_SECRET_KEY=...
INTERNALIO_CONNECTOR_SECRET_KEY=...
```

## Configure License Key
In your Heroku `internalio` project, ensure that the `INTERNALIO_LICENSE_KEY` Config Var is configured correctly before attempting to access Internal OnPrem.
