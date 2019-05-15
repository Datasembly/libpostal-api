`libpostal-api.go` contains code for server.
`Dockerfile` creates code for creating docker container, run as `docker build -t libpostal-api .` in the root directory of this repository.
`build_libpostal.sh` and `build_libpostal_api.sh` contain simple bash instructions used during creation of docker image that install `libpostal` and necessary go packages.
