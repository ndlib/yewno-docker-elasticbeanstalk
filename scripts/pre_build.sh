#! /bin/sh
DIR="$(cd $(dirname "${0}"); pwd)"
. "${DIR}/set_environment.sh"

pipenv install --deploy
