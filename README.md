# docker-meteor
Dockerfile for Meteor 1.3+


## Description
This is a simple Dockerfile for running Meteor 1.3+ with Docker. This implements the new NPM integration included in Meteor 1.3, and installs all necessary NPM modules.

## Usage
Just place this file into the root of your Meteor installation. You can build the command by running:

```
docker build -t foo/barbaz:1.0.0 .
```

## Advanced Usage
Place the [.dockerbuilddeploy](https://github.com/markoshust/docker-meteor/blob/master/.dockerbuilddeploy) in the root of your Meteor directory, update it's contents where appropriate, make it executable, then run the command:

```
./.dockerbuilddeploy staging 1.0.0
```

This will build a Docker image for the appropriate environment (staging/production) and the appropriate tag (ex. 1.0.0), push it to Google Cloud, then deploy it to Kubernetes via a rolling-update. This requires Google Container Registry enabled and gcloud cli to be installed, and knowledge of Kubernetes, but can deploy your Meteor app without downtime on an awesome architecture.
