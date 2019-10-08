#!/bin/sh

set -xe

mvn package && \
mv /usr/src/app/target/${ARTIFACT_ID}-1.0-SNAPSHOT.jar /dist/${ARTIFACT_ID}-1.0-SNAPSHOT.jar
