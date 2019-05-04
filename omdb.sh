#!/bin/bash

set -euo pipefail

source omdbapi.sh

usage() {
    scriptName=`basename ${BASH_SOURCE[0]}`     ## file name of this script.

    echo "
usage: $scriptName [options]
    -t=<title>|--title=<title>
        Finds an exact match on a title of a movie: --title='star wars'

    -r=<title>|--rating=<title>
        Finds the rotten tomatos rating of a movie: --rating='star wars'

    --help   optional  Print this help message
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

    CMDS=()
    OPTIONS=""

    for i in "$@"
    do
        case $i in
            -t=*|--title=*)
                CMDS+=('title')
                OPTIONS="${i#*=}"
                shift # past argument=value
            ;;
            -r=*|--rating=*)
                CMDS+=('rating')
                OPTIONS="${i#*=}"
                shift # past argument=value
            ;;
            --help)
                usage
                exit 1
            ;;
        esac
    done

    if [ ${#CMDS[@]} -eq 0 ]; then
        usage
        exit 1
    fi

    for command in "${CMDS[@]}"
    do
        # echo "command: $command"
        if ! fn_exists $command; then
            echo "\n*** function: '$command' does not exist ***"
            exit
        fi
        echo $($command ${OPTIONS})
    done
}

main $@
