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
2. Authenticate via the Heroku CLI:
```
heroku auth:login
```
3. Run the installation script:

This script will prompt you to choose a project name and deploy Internal OnPrem.
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

## Upgrading
1. Fork this repository.
1. Set the version number that you wish to upgrade to in the `Dockerfile` in this repository:
```
FROM internalio/onprem:2.10.0    # Current version as of 2021-07-20
```

2. Commit and push the changes to heroku:
```
git push heroku master 
```
3. Observe that the upgrade completes successfully.  It is normal to see output that is similar to this:
```
$ git push heroku master
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 320 bytes | 320.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote: === Fetching app code
remote:
remote: === Building release (Dockerfile)
remote: Sending build context to Docker daemon  9.728kB
remote: Step 1/4 : FROM internalio/onprem:2.10.0
remote: 2.10.0: Pulling from internalio/onprem
remote: a31c7b29f4ad: Pulling fs layer

...[output snipped]...

remote: e020d13e8a78: Pull complete
remote: Digest: sha256:cc5f38f4b6ff5aca5c3273784d93ed005188d893a09141e8fc41b150d43889b4
remote: Status: Downloaded newer image for internalio/onprem:2.10.0
remote:  ---> 1e5f33c30558
remote: Step 2/4 : ADD entrypoint.sh /usr/local/bin/entrypoint
remote:  ---> f584672e66db
remote: Step 3/4 : ADD release.sh /usr/local/bin/release
remote:  ---> 58d6a0ba27b4
remote: Step 4/4 : CMD ["/usr/local/bin/entrypoint"]
remote:  ---> Running in 42032e1951c8
remote: Removing intermediate container 42032e1951c8
remote:  ---> 21e9b357d8f4
remote: Successfully built 21e9b357d8f4
remote: Successfully tagged 62aa596fd53f92ac51a6726ef26bb01cf6510322:latest
remote:
remote: === Pushing release (Dockerfile)
remote: Tagged image "62aa596fd53f92ac51a6726ef26bb01cf6510322" as "registry.heroku.com/internalio/release"
remote: Using default tag: latest
remote: The push refers to repository [registry.heroku.com/internalio/release]
remote: 93bdd53e5edc: Preparing

...[output snipped]...

remote: 7bdb517c56fd: Mounted from internalio/release
remote: latest: digest: sha256:b21d8a332a9fee767f0842d68feed5f1d24d76ba42578947b7afe31ed1d67404 size: 1996
remote:
remote: Verifying deploy... done.
remote: Running release command...
remote:
remote: Migrating databases... (this may take 1-2 minutes)
remote: Operations to perform:
remote:   Apply all migrations: auth, console, contenttypes, sessions
remote: Running migrations:
remote:   Applying console.0334_update_multipart_body_function_parameter_source_type... OK
remote:   Applying console.0334_auto_20210714_1751... OK
remote:   Applying console.0335_merge_20210716_1840... OK
remote: psql:/srv/internalio/connector/schema.sql:5: ERROR:  relation "credentials" already exists
remote: psql:/srv/internalio/connector/schema.sql:12: ERROR:  relation "deleted_credentials" already exists
remote: Waiting for release.... done.
To https://git.heroku.com/internalio.git
   6b1dae2..e55319e  master -> master
```
