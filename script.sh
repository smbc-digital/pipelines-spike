#!/usr/bin/env bash

# TODO:: get from command line args
FILEPATH="./package.json"
# TODO:: make work with list of messages
COMMITMESSAGE="major(Blah): blah"

version=0
major=0
minor=0
patch=0

getVersionFromFile() {
    while IFS= read -r line
    do
        if [[ $line =~ "version" ]]
        then
            version="${line//[!0-9.!0-9.!0-9]/}"
        fi
    done < $FILEPATH

    regexp="([0-9]{0,})[.]([0-9]{0,})[.]([0-9]{0,})"
    if [[ $version =~ $regexp ]]; then
        major=${BASH_REMATCH[1]}
        minor=${BASH_REMATCH[2]}
        patch=${BASH_REMATCH[3]}
    fi
}

incrementMajor() {
    major=$(($major + 1))
    minor=0
    patch=0
    version="$major.$minor.$patch"
}

incrementMinor() {
    minor=$(($minor + 1))
    patch=0
    version="$major.$minor.$patch"
}

incrementPatch() {
    patch=$(($patch + 1))
    version="$major.$minor.$patch"
}

incrementVersion() {
    currentVersion=$1
    commitMessage=$2

    regexp="([A-Za-z]{0,})\("
    if [[ $commitMessage =~ $regexp ]]; then
        type=${BASH_REMATCH[1]}

        case $type in
            "fix")
                incrementPatch
                ;;
            "feature")
                incrementMinor
                ;;
            "major")
                incrementMajor
                ;;
        esac
    fi
}

getVersionFromFile
incrementVersion $version $COMMITMESSAGE

echo "Current version: $version"
exit 1

#trest

#test1