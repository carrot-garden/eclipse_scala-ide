#!/bin/bash -e

# this folder
base=${BASH_SOURCE%/*}
cd "$base"

repo="$base/scalor"
echo "### using scalor repository: $repo"

side="$repo/org/scala-ide"
echo "### removing local artifacts: $side"
rm -r -f "$side"

maven_opts="\
-P scala-2.12.x \
-P eclipse-oxygen \
-D skipTests \
-D maven.repo.local=$repo \
-B"

./build-all.sh clean install $maven_opts
