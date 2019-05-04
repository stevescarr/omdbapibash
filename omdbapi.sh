#!/bin/bash

set -euo pipefail

OMDB_API_URL=${OMDB_API_URL:-'http://www.omdbapi.com/'}

API_KEY=${API_KEY:-}
if [ -z "${API_KEY}" ]
then
    echo "Please make sure an API_KEY for OMDB can be find in the environment variables"
    exit 1
fi

findByTitle() {
    title=$@
    endpoint=""
    queryParam="t"
    response=$(curl "${OMDB_API_URL}${endpoint}?apikey=${API_KEY}&${queryParam}=${title}" --silent)
    echo $response
}

title() {
    title=$@
    echo $(findByTitle $title)
}

rating() {
    title=$1
    response=$(findByTitle $title)
    echo $response | jq -c '.Ratings[] | select(.Source | contains("Rotten Tomatoes")) | .Value' | tr -d '"'
}
