# markoshust/meteor
Standard Dockerfile for deploying bundled Meteor apps.

## Description
This is a simple onbuild Dockerfile for running Meteor 1.3+ with Docker.

## Usage
Just create a new `Dockerfile` in the root of your application:

```
FROM markoshust/meteor
```

Then, add an appropriate [.dockerignore](https://github.com/markoshust/docker-meteor/blob/master/.dockerignore) file to the root of your application.

Finally, build your Docker image by running:

```
docker build -t foo/barbaz:1.0.0 .
```

## Advanced Usage
Place the [.dockerbuilddeploy](https://github.com/markoshust/docker-meteor/blob/master/.dockerbuilddeploy) in the root of your Meteor directory, update it's contents where appropriate, make it executable, then run the command:

```
./.dockerbuilddeploy staging 1.0.0
```

This will build a Docker image for the appropriate environment (staging/production) and the appropriate tag (ex. 1.0.0), push it to a Docker registry, then start a container on your production server with your desired configuration.
