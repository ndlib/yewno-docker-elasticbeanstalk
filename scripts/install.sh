#! /bin/sh
DIR="$(cd $(dirname "${0}"); pwd)"
. "${DIR}/set_environment.sh"

pip -q install -U pipenv
