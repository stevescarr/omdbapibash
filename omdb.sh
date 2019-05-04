#!/bin/bash

set -euo pipefail

source omdbapi.sh

usage() {
    scriptName=`basename ${BASH_SOURCE[0]}`     ## file name of this script.

    echo "
usage: $scriptName [options]
    -t=<title>
        Finds an exact match on a title of a movie: -t='star wars'

    -r=<rating>
        Finds the rotten tomatos rating of a movie: -r='star wars'

    -h   optional  Print this help message
    "
}

fn_exists() {
  # appended double quote is an ugly trick to make sure we do get a string -- if $1 is not a known command, type does not output anything
  [ `type -t $1`"" == 'function' ]
}

main() {

    # No arguments given, default to usage
    if [ $# -eq 0 ]
    then
        usage
        exit 1
    fi

    t=""
    r=""

    while getopts ":r:t:" o; do
        case "${o}" in
            t)
                t=${OPTARG}
                ;;
            r)
                r=${OPTARG}
                ;;
            *)
                usage
                ;;
        esac
    done
    shift $((OPTIND-1))

    if [ ! -z "$t" ]; then
        echo $(title ${t})
    fi

    if [ ! -z "$r" ]; then
        echo $(rating ${r})
    fi
}

main $@
