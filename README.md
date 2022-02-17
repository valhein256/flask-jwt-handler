# Run Flask Service on Docker Container

## Build
Build docker image for flask server.

    $ make build

## Launch
Launch docker container to run Flask service

    $ make launch-service

## Python Libs
see [service/pyproject.toml].
To update python libs:

    $ make service-libs-update

### Install other python package
Run following command to launch service-dev

    # login service-dev
    $ make service-dev
    # install py-package
    (service-devenv):/opt/app# poetry add <py-package>

It would update the poetry files: [service/pyproject.toml] and [service/poetry.lock].
Run following command to rebuild docker image with new for <py-package> F=flask server. 

    $ make build

[service/pyproject.toml]: https://github.com/valhein256/flask-devenv/blob/master/service/pyproject.toml
[service/poetry.lock]: https://github.com/valhein256/flask-devenv/blob/master/service/poetry.lock
