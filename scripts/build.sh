#! /bin/sh
DIR="$(cd $(dirname "${0}"); pwd)"
. "${DIR}/set_environment.sh"

cp -Rp "${PY_SITE_PACKAGES}" "${CODEBUILD_SRC_DIR}/"
