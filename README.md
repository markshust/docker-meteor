# markoshust/meteor

Standard Dockerfile for deploying bundled Meteor apps.

## Description

This is a simple onbuild Dockerfile for running Meteor 1.3+ with Docker.

## Versions

The following tags are available, and correspond to the related Node.JS version supported by Meteor:

- `8.8`, `latest`
- `4.8-1`, `4.8`
- `4.7`
- `4.6`
- `4.5`
- `4.4`
- `0.10`

## Usage

Just create a new `Dockerfile` in the root of your application, specifying the version of Node that your Meteor install is setup to use (find this out with `meteor node --version`):

```
FROM markoshust/meteor:8.8
```

Then, build your Docker image by running:

```
docker build -t foo/bar:1.0.0.0 .
```

This image uses yarn to install node modules, so it is highly recommended to use yarn when developing and installing modules locally. You can do this by running `meteor npm i -g yarn@1.2`, and then use `meteor yarn` instead of `meteor npm install`.

## Advanced Usage

Place the [.builddeploy](https://github.com/markoshust/docker-meteor/blob/master/.builddeploy) in the root of your Meteor directory, update it's contents where appropriate, make it executable, then run the command:

```
./.builddeploy production 1.0.0.0
```

This will build a Docker image for the appropriate environment (production or staging) and the appropriate tag (ex. 1.0.0.0), push it to a Docker registry, then start a container on your production server with your desired configuration.
