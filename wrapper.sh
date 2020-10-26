#!/bin/sh


set -e

build() {
  docker-compose up --build maven
  docker-compose build back
}

restart() {
  docker-compose restart back
}

logs() {
  docker-compose logs -f back
}

clear() {
  docker-compose down -v --remove-orphans
  docker volume prune --force
  docker image prune --force
}

up() {
  build
  docker-compose up --no-start back
  restart
}

help() {
  echo "usage: ./wrapper.sh [option]"
  echo "available options:"
  echo "build\t\tre-compiles the code, should be followed by a restart."
  echo "restart\t\trestarts the java container - is needed to take modifications into account."
  echo "up\t\ttriggers build then a restart."
  echo "logs\t\tgets java's logs."
  echo "clear\t\tWARNING: hard reset on everything. Kills containers, volumes (including database data), images and kittens."
  echo "help\t\tdisplays this message."
  exit 0
}

if [ $# -ne 1 ]
  then
    help
fi

case $1 in
  build|restart|logs|clear|up|help) $1;;
  *) help;;
esac