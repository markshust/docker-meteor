# docker-meteor
Dockerfile for Meteor 1.3+


## Description
This is a simple Dockerfile for running Meteor 1.3+ with Docker. This implements the new NPM integration included in Meteor 1.3, and installs all necessary NPM modules.

## Usage
Just place this file into the root of your Meteor installation. You can build the command by running:

```
docker build -t foo/bar:1.0.0 .
```
