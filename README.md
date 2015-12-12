# TW-IN-OUT

[![Build Status](https://snap-ci.com/thoughtworks/tw-in-out/branch/master/build_image)](https://snap-ci.com/thoughtworks/tw-in-out/branch/master)

App to track your work punches

### Environment
In order to run either the application or tests locally you must create a .env
file as following:

```
TW_IN_OUT_DB_HOST=localhost
```

### Docker Toolbox
If you want to use [Docker](https://docs.docker.com/), install version 1.3 or greater:

* [Getting started guide](https://www.docker.com/toolbox)

If you are cool and use brew cask:

```
$ brew cask install dockertoolbox
```

# Set Up

This command will start docker, install all required gems (`bundle install`) and
run the app on port 3000

```
$ make
```

# Running locally

Add docker host on your etc.hosts file with the following commands, then you will be able to
authenticate with the google sandbox account created for test purposes:

```
sudo sh -c "echo '$(docker-machine ip tw-in-out) dockerhost local.docker.com' >> /etc/hosts"
```

then, just go to your browser and access http://local.docker.com:3000

# Running the tests

```
$ make test
```
