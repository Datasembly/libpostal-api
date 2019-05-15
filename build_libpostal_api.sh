#!/usr/bin/env bash
set -e

curl https://storage.googleapis.com/golang/go1.12.5.linux-amd64.tar.gz > go1.12.5.linux-amd64.tar.gz

echo "aea86e3c73495f205929cfebba0d63f1382c8ac59be081b6351681415f4063cf  go1.12.5.linux-amd64.tar.gz" | sha256sum -c

tar xzf go1.12.5.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export GOBIN=/libpostal/go/bin
export PATH=$PATH:/libpostal/go/bin

go get github.com/gorilla/mux
go get github.com/openvenues/gopostal/expand
go get github.com/openvenues/gopostal/parser
go install ./libpostal-api.go
