#!/usr/bin/env bash

# TODO:: get from command line args
FILEPATH="./package.json"
COMMITMESSAGE="feature(Blah): blah"
version="1"

getVersionFromFile() {
    while IFS= read -r line
    do
        if [[ $line =~ "version" ]]
        then
            version="${line//[!0-9.!0-9.!0-9]/}"
        fi
    done < $FILEPATH
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

    switch($commitMessage):
    # switch on commitmessage contains feat() run incrementMinor etc. etc.

    version="4000"
}

getVersionFromFile

echo "Current version: $version"