#!/bin/sh
# Licensed to the Apache Software Foundation (ASF)
# Maven wrapper script - downloads and runs Maven

# Resolve the working directory
PRG="$0"
while [ -h "$PRG" ]; do
  ls=$(ls -ld "$PRG")
  link=$(expr "$ls" : '.*-> \(.*\)$')
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=$(dirname "$PRG")"/$link"
  fi
done
DIRNAME=$(dirname "$PRG")
BASEDIR=$(cd "$DIRNAME/.." > /dev/null && pwd)

# Read maven wrapper properties
if [ -r "$BASEDIR/.mvn/wrapper/maven-wrapper.properties" ]; then
  . "$BASEDIR/.mvn/wrapper/maven-wrapper.properties"
fi

# Use default Maven version if not configured
if [ -z "$MAVEN_VERSION" ]; then
  MAVEN_VERSION="3.9.6"
fi

# OS specific support
case "$(uname)" in
  CYGWIN*) cygwin=true;;
  MINGW*) mingw=true;;
esac

# Check if Maven is available locally
if [ -d "$BASEDIR/.mvn/mvn-$MAVEN_VERSION" ]; then
  MVN_CMD="$BASEDIR/.mvn/mvn-$MAVEN_VERSION/bin/mvn"
else
  # Download Maven if not present
  mkdir -p "$BASEDIR/.mvn"
  
  # Try to use Maven from PATH
  MVN_CMD="mvn"
  if ! command -v mvn &> /dev/null; then
    echo "Maven not found. Please install Maven or run this script in an environment where Maven is available."
    exit 1
  fi
fi

exec "$MVN_CMD" "$@"
