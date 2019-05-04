# omdbapibash

Online Movie Database API in Bash

This project will collect data from Open Movie Database using bash scripts through docker. In particular it will fetch all the data from a particular movie title or the rotten tomato rating for a particular movie.

*Please note, it will only work on exact matches, not on substrings of movie titles*

## Getting Started

### Prerequisites

Docker

[https://www.docker.com/get-started](https://www.docker.com/get-started)

### Installing

A step by step series of examples that tell you how to get a development env running

Clone the repo

```
git clone git@github.com:stevescarr/omdbapibash.git
```

Build the docker image: `docker build -t <NAME_OF_IMAGE> .`

```
docker build -t omdbbashapi .
```

Run the docker image: `docker run -e API_KEY=<APIKEY> --rm omdbapibash:latest bash omdb.sh`

```
docker run -e API_KEY=1a32b3c4d --rm omdbapibash:latest bash omdb.sh -h
docker run -e API_KEY=1a32b3c4d --rm omdbapibash:latest bash omdb.sh --help
```

### Tests

Tests are not implemented for this bash tool

## Examples

Display Help

```
docker run --rm omdbbashapi:latest bash omdb.sh
docker run --rm omdbbashapi:latest bash omdb.sh -h
docker run --rm omdbbashapi:latest bash omdb.sh --help
```

Find the rotten tomato rating for the movie avatar

```
docker run --rm omdbbashapi:latest bash omdb.sh -rr=avatar
docker run --rm omdbbashapi:latest bash omdb.sh --rottenrating=avatar
```

Find all info about movie titanic in JSON format

```
docker run --rm omdbbashapi:latest bash omdb.sh -t=titanic
docker run --rm omdbbashapi:latest bash omdb.sh --title=titanic
```

## Known Issues

* Parsing command line parameters is presently unavailable. I will have to update this.

## Built With

* [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) - Bash Scripting Language
* [jq](https://stedolan.github.io/jq/) - jq is a lightweight and flexible command-line JSON processor.
* [curl](https://curl.haxx.se/) - command line tool and library for transferring data with URLs

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [Open Movie DataBase](http://www.omdbapi.com/)
