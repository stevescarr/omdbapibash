#!/bin/bash

set -euo pipefail

OMDB_API_URL="http://www.omdbapi.com/"

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

rottenrating() {
    title=$@
    response=$(findByTitle ${title})
    echo $response | jq -c '.Ratings[] | select(.Source | contains("Rotten Tomatoes")) | .Value' | tr -d '"'
}
