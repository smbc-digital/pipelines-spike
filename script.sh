#!/usr/bin/env bash

# TODO:: get from command line args
FILEPATH="./package.json"
COMMITMESSAGE="feature(Blah): blah"
version="1"

getVersionFromFile() {
    currentVersion=$1
    version="4000"
}

incrementMajor() {
    currentVersion=$1
    version="4000"
}

incrementMinor() {
    currentVersion=$1
    version="4000"
}

incrementPatch() {
    currentVersion=$1
    version="4000"
}

incrementVersion() {
    currentVersion=$1
    commitMessage=$2
    version="4000"
}

incrementVersion "TEST" "TEST"

echo "$VERSION"