#!/usr/bin/env bash
set -e

declare -r JOBID=${TRAVIS_JOB_ID:=1}
declare -r REVISION=$(printf "%04d" $JOBID)
declare -r OUTPUT=../../artifacts

echo "building revision $REVISION"
dotnet restore src/SendOwl
dotnet restore src/SendOwl.Test

dotnet test src/SendOwl.Test

dotnet pack -c Release src/Sendowl -o $OUTPUT --version-suffix=ci-$REVISION
